(ns feed.irds-listing
  (:require [clojure.java.jdbc :refer :all]
            [util.irds :as util])
  (:gen-class))

(defn get-eq-listings
  [con]
  (let [c (db-find-connection con)
        q (str "select * from IRDS_OWNER.VW_EQUITY_LISTING L where L.\"ListingRUID\" in (?) and  L.\"StatusCode\" = 'Active'")
        ps (.prepareStatement c q)]
    (fn [data] (doall
                 (->> (doto ps
                        (.setFetchSize 15000)
                        (.setString 1 (clojure.string/join data)))
                      .executeQuery
                      result-set-seq)))))

(defn listing-alt-id-delta [con date]
  (let [c (db-find-connection con)
        q (str "SELECT DISTINCT
  SP.EQUITY_LISTING_RUID AS \"ListingRUID\",
  SP.ID_TYPE             AS \"IdType\",
  SP.ALTERNATE_ID        AS \"AlternateId\",
  EV.\"CountryLocationCode\",
  L.\"OPOLMic\" "
               "FROM TABLE (pkg_irds_equity.get_equity_xref(input_type => 'RUID', id_value => PKG_IRDS_EQUITY.GET_UPDATED_INSTRUMENTS(TO_TIMESTAMP('"
               date " 00:00:00.000', 'DD/MM/YYYY HH24:MI:SS.FF3'), 'equity_listing'), altid_type => '', return_related_ids =>'N')) SP "
               "INNER JOIN IRDS_OWNER.VW_EQUITY_LISTING L ON L.\"ListingRUID\" = SP.EQUITY_LISTING_RUID "
               "LEFT JOIN IRDS_OWNER.VW_EXECUTION_VENUE EV ON EV.\"ExecutionVenueRUID\" = L.\"ExecutionVenueRUID\" "
               "WHERE ID_TYPE IN ('DBLSTID', 'BBCTICKER', 'BBETICKER', 'BBUNIQUE', 'RIC', 'SEDOL') AND STATUS_CODE = 'Active' AND "
               "L.\"StatusCode\" = 'Active' AND EV.\"StatusCode\" = 'Active' "
               "ORDER BY EQUITY_LISTING_RUID")
        ps (.prepareStatement c q)]
    (doall
      (->> (doto ps
             (.setFetchSize 15000))
           .executeQuery
           result-set-seq))
    ))
(defn listing-delta [con date]
  (let [c (db-find-connection con)
        q (str "SELECT DISTINCT EQUITY_LISTING_RUID AS \"ListingRUID\", PARENT_INSTRUMENT_RUID  AS \"ParentInstrumentRUID\", EXECUTION_VENUE_RUID AS \"ExecutionVenueRUID\", PRIMARY_MARKET_INDICATOR AS \"PrimaryMarketIndicator\" "
               "FROM TABLE (pkg_irds_equity.GET_EQUITY_LISTING_DETAILS(input_type => 'RUID', id_value => PKG_IRDS_EQUITY.GET_UPDATED_INSTRUMENTS("
               "TO_TIMESTAMP('" date " 00:00:00.000', 'DD/MM/YYYY HH24:MI:SS.FF3'), 'equity_listing'), listing_altid_type => 'RUID', issue_altid_type => '', exchange_type => '')) WHERE STATUS_CODE='Active' ORDER BY PARENT_INSTRUMENT_RUID")
        ps (.prepareStatement c q)]
    (doall
      (->> (doto ps
             (.setFetchSize 15000))
           .executeQuery
           result-set-seq))
    ))

(defn listing-one-off [con]
  (let [c (db-find-connection con)
        q (str "SELECT DISTINCT L.\"ListingRUID\", L.\"ParentInstrumentRUID\", L.\"ExecutionVenueRUID\", L.\"PrimaryMarketIndicator\" "
               "FROM IRDS_OWNER.VW_EQUITY E INNER JOIN IRDS_OWNER.VW_EQUITY_LISTING L ON L.\"ParentInstrumentRUID\" = E.\"EquityRUID\" "
               "LEFT JOIN IRDS_OWNER.VW_EXECUTION_VENUE EV ON EV.\"ExecutionVenueRUID\" = L.\"ExecutionVenueRUID\" "
               "WHERE L.\"StatusCode\"='Active' AND E.\"StatusCode\" ='Active' AND EV.\"StatusCode\" ='Active' ORDER BY 'ParentInstrumentRUID'")
        ps (.prepareStatement c q)]
    (doall
      (->> (doto ps
             (.setFetchSize 15000))
           .executeQuery
           result-set-seq))))






(defn -main [& args]
  (with-db-connection [con util/db-speck]
                      ;;(prn (str "one- off: " (time (count (listing-one-off con)))))
                      (prn (str "listing-delta " (time (count (listing-delta con "13/07/2015")))))
                      (prn (str "listing-alt-id-delta" (time (count (listing-alt-id-delta con "13/07/2015")))))))
