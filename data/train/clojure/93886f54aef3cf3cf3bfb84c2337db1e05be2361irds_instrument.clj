(ns feed.irds-instrument
  (:require [clojure.java.jdbc :refer :all]
            [util.irds :as util]
            [feed.core :refer :all]
            [clojure.core.async :as async])
  (:gen-class))

(defn- build-query [name date]
  (let [instrument-queries
        {
         :instrument-delta           (str "SELECT EQUITY_RUID AS \"EquityRUID\", EQUITY_NAME AS \"EquityName\", EQUITY_DESCRIPTION AS \"EquityDescription\", "
                                          "DENOMINATED_CURRENCY_CODE AS \"DenominatedCurrencyCode\", RULE144A_INDICATOR AS \"Rule144AIndicator\", "
                                          "REGS_INDICATOR AS \"RegSIndicator\", to_char(EQUITY_ISSUE_DATE, 'DD/MM/YYYY') AS \"EquityIssueDate\", IL_LIQUIDITY_INDICATOR AS \"IlliquidityIndicator\", "
                                          "EXERCISE_STYLE_TYPE_CODE AS \"ExerciseStyleTypeCode\", EXERCISE_PRICE_AMOUNT AS \"ExercisePriceAmount\", to_char(EXERCISE_DATE, 'DD/MM/YYYY') AS \"ExerciseDate\", "
                                          "to_char(MATURITY_DATE, 'DD/MM/YYYY') AS \"MaturityDate\", PUT_CALL_INDICATOR_CODE AS \"PutCallIndicatorCode\", ISSUER_ID AS \"IssuerId\" "
                                          "FROM table(IRDS_OWNER.pkg_irds_equity.get_equity_issue_details(input_type => 'RUID', id_value => IRDS_OWNER.PKG_IRDS_EQUITY.GET_UPDATED_INSTRUMENTS(TO_TIMESTAMP('%s 00:00:00.000', 'DD/MM/YYYY HH24:MI:SS.FF3'),'equity_issue'), altid_type => 'RUID')) "
                                          "WHERE STATUS_CODE='Active' ORDER BY EQUITY_RUID")
         :instrument-alt-id-delta    (str "SELECT DISTINCT PARENT_INSTRUMENT_RUID AS \"EquityRUID\", ID_TYPE AS \"IdType\", ALTERNATE_ID AS \"AlternateId\" FROM table(pkg_irds_equity.get_equity_xref(input_type => 'RUID', id_value => IRDS_OWNER.PKG_IRDS_EQUITY.GET_UPDATED_INSTRUMENTS(TO_TIMESTAMP('%s 00:00:00.000','DD/MM/YYYY HH24:MI:SS.FF3'),'equity_issue'), altid_type => '', return_related_ids =>'N')) WHERE ID_TYPE IN ('CUSIP', 'HONGKONG', 'AUSTRIA', 'PILC', 'TAIWANCD', 'VALOREN', 'DUTCH', 'SICOVAM', 'WPK', 'BELGIUM', 'ISIN', 'DBSECID', 'CINS', 'AUS', 'MALAYSIACD') AND STATUS_CODE='Active' ORDER BY PARENT_INSTRUMENT_RUID")
         :instrument-class-delta     (str "SELECT DISTINCT EQUITY_RUID, COVERED_WARRANT_INDICATOR, ISSUE_TYPE as \"Issue Type\", BLMBERG_ISSUER_INDUSTRY_CLASS as \"BBG Issuer Industry Class\", BB_INDUSTRY_SECTOR as \"BB Industry Sector\", BB_INDUSTRY_GROUP as \"BB Industry Group\", BB_INDUSTRY_SUBGROUP as \"BB Industry SubGroup\", SIC_CODE as \"SIC Code\", ISO_CFI_CODE as \"ISO CFI Code\", REUTERS_ASSET_CLASS as \"Reuters Asset Class\", GICS_CODE as \"GICS Code\" FROM TABLE(pkg_irds_equity.get_equity_issue_details(input_type => 'RUID', id_value => IRDS_OWNER.PKG_IRDS_EQUITY.GET_UPDATED_INSTRUMENTS(TO_TIMESTAMP('%s 00:00:00.000', 'DD/MM/YYYY HH24:MI:SS.FF3'),'equity_issue'), altid_type => 'RUID')) WHERE STATUS_CODE='Active' ORDER BY EQUITY_RUID")
         :instrument-underlier-delta (str "SELECT DISTINCT EQUITY_RUID AS \"EquityRUID\",  UNDERLIER_RUID AS \"UnderlierRUID\",  NULL AS \"ExecutionVenueRUID\" FROM TABLE(IRDS_OWNER.PKG_IRDS_EQUITY.GET_EQUITY_UNDERLIER_DETAILS(input_type => 'RUID', id_value => IRDS_OWNER.PKG_IRDS_EQUITY.GET_UPDATED_INSTRUMENTS(TO_TIMESTAMP('%s 00:00:00.000','DD/MM/YYYY HH24:MI:SS.FF3'),'equity_issue'), issue_altid_type => '', listing_altid_type => '', exchange_type => '')) WHERE \"UNDERLIER_RUID\" IS NOT NULL UNION SELECT DISTINCT ETPRUID AS \"EquityRUID\",  CONST_LINKED_CONST_INSTR_RUID AS \"UnderlierRUID\",  CONST_EXECUTION_VENUE_RUID AS \"ExecutionVenueRUID\" FROM TABLE(pkg_irds_index.get_etf_composition('RUID', PKG_IRDS_INDEX.GET_UPDATED_INSTRUMENTS(TO_TIMESTAMP('%s 00:00:00.000','DD/MM/YYYY HH24:MI:SS.FF3'),'etp'), 'RUID', 'RUID', sysdate, 'calculation')) WHERE \"CONST_LINKED_CONST_INSTR_RUID\" IS NOT NULL ORDER BY \"EquityRUID\"")}]
    (get-query instrument-queries name date)))


(defn- in-memory-load
  []
  (with-db-connection [con util/db-speck]
                      (prn (str "instrument-delta " (time (count (delta-query con (build-query :instrument-delta "13/07/2015"))))))
                      (prn (str "instrument-alt-id-delta " (time (count (delta-query con (build-query :instrument-alt-id-delta "13/07/2015"))))))
                      (prn (str "instrument-class-delta " (time (count (delta-query con (build-query :instrument-class-delta "13/07/2015"))))))
                      '(prn (str "instrument-underlier-delta " (time (count (delta-query con (build-query :instrument-underlier-delta "13/07/2015"))))))))



(defn -main [& args]
  (let [ext-chan [(delta-query-async util/db-speck (build-query :instrument-delta "15/07/2015") "./instrument_delta.txt")
                  (delta-query-async util/db-speck (build-query :instrument-alt-id-delta "15/07/2015") "./instrument_alt_id_delta.txt")
                  (delta-query-async util/db-speck (build-query :instrument-class-delta "15/07/2015") "./instrument_class_delta.txt")]
        result-chan (async/merge ext-chan)]
    (time (async/<!!
            (async/go-loop []
              (when-let [file-name (async/<! result-chan)]
                (prn file-name)
                (recur))))))
  ;;(in-memory-load)
  )