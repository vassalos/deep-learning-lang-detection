(ns util.irds
  (:require [utils.db :refer :all]
            [clojure.core.async :as async]
            [stream.csv :refer :all]
            [clojure.java.jdbc :refer :all])
  (:import (oracle.jdbc.pool OracleDataSource)
           (oracle.sql.ARRAY))
  (:gen-class))

'(def db-speck {:datasource (doto (OracleDataSource.)
                              (.setPassword "temp#123")
                              (.setUser "TCH_READONLY")
                              (.setURL "jdbc:oracle:thin:@lndrdsu1.uk.db.com:1700:LNDRDSU1"))})
(def db-speck {:datasource (doto (OracleDataSource.)
                             (.setPassword "Take_1t_Easy")
                             (.setUser "TDH_READONLY")
                             (.setURL "jdbc:oracle:thin:@lndrdsp1.uk.db.com:1617:LNDRDSP1"))})

(defn find-inst-id
  "Fetches just the updated instrument ids, doesn't include any details"
  [date]
  (let [q (str "select * from TABLE (IRDS_OWNER.PKG_IRDS_EQUITY.GET_UPDATED_INSTRUMENTS("
               "TO_TIMESTAMP('" date " 00:00:00.000', 'DD/MM/YYYY HH24:MI:SS.FF3'),"
               " 'equity_issue'))")]
    (stream-result-set db-speck q)))

(defn get-instr-details [con]
  (let [c (db-find-connection con)
        q (str "SELECT * FROM TABLE (IRDS_OWNER.pkg_irds_equity.get_equity_issue_details(input_type => 'RUID', id_value => ?, altid_type => 'RUID')) "
               "WHERE STATUS_CODE = 'Active' ORDER BY EQUITY_RUID")
        ps (.prepareStatement c q)]
    (fn [data]
      (doall (->> (doto ps
                    (.setFetchSize 15000)
                    (.setArray 1 (.createARRAY c "IRDS_OWNER.STRING_ARRAY" (to-array data))))
                  .executeQuery
                  result-set-seq)))))



(defn- get-all-details
  "Extracts the instrument utils in one call using embeded calls"
  [date]
  (with-db-connection [con db-speck]
                      (let [q (str "SELECT * FROM " "TABLE (IRDS_OWNER.pkg_irds_equity.get_equity_issue_details(input_type => 'RUID',"
                                   " id_value => IRDS_OWNER.PKG_IRDS_EQUITY.GET_UPDATED_INSTRUMENTS(TO_TIMESTAMP('"
                                   date " 00:00:00.000', 'DD/MM/YYYY HH24:MI:SS.FF3'), 'equity_issue'), altid_type => 'RUID')) "
                                   "WHERE STATUS_CODE = 'Active' ORDER BY EQUITY_RUID")]
                        (stream-result-set db-speck q))))

;; equity listings
(defn- updated-eq-list [date]
  (let [q (str "select "
               "EQUITY_LISTING_RUID AS ListingRUID, "
               "ID_TYPE             AS IdType, "
               "ALTERNATE_ID        AS AlternateId "
               "FROM TABLE (pkg_irds_equity.get_equity_xref(input_type => 'RUID', id_value => PKG_IRDS_EQUITY.GET_UPDATED_INSTRUMENTS(
               TO_TIMESTAMP('" date " 00:00:00.000', 'DD/MM/YYYY HH24:MI:SS.FF3'), 'equity_listing'), altid_type => '', return_related_ids =>'N'))")]
    (prn q)
    (stream-result-set db-speck q)))


(defn async-batch [ch size]
  (let [out (async/chan)
        buf (atom [])]
    (async/go-loop []
      (if-let [item (async/<! ch)]
        (do (swap! buf (fn [d] (conj d item)))
            (when (= size (count @buf))
              (async/>! out @buf)
              (reset! buf []))
            (recur))
        (async/close! out)
        ))
    out))

(defn extract-details
  "extract all instrument details by composing 2 stored procedure call"
  [con date]
  (let [details-extractor (get-instr-details con)
        src-chan (find-inst-id date)
        t1-chan (async/pipe src-chan (async/chan 15000 (map :column_value))) ;;extracts only the ID
        batch-chan (async-batch t1-chan 15000)
        out-chan (async/chan)]                              ;;build batches in 300
    (async/go-loop []
      (if-let [item (async/<! batch-chan)]
        (do
          (let [details (time (details-extractor item))]
            (async/>! out-chan details))
          (recur))
        (async/close! out-chan)))
    out-chan))

(defn- extract-single
  "call the all-in one procedure"
  [date extractor]
  (let [ch (extractor date)]
    (time (async/<!!
            (async/go-loop []
              (when-let [item (async/<! ch)]
                (recur)))))))

(defn- extract-async [date]
  (with-db-connection [con db-speck]
                      (time (async/<!!
                              (let [ch (extract-details con date)]
                                (async/go-loop []
                                  (when-let [item (async/<! ch)]
                                    (do
                                      ;;(prn item)
                                      (recur)))))))))


'(defn -main [& args]
  (extract-single "12/07/2015" updated-eq-list))
