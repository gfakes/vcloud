(ns harbinger.et.config.rad-siu
  (:require [harbinger.et.hl7 :as hl7]
	    [clojure.data.json :as json]
	    [clojure.string :as str]
            [harbinger.et.server :as server]))

(def config
  {
   :transaction_date_time "MSH.7 DT"
   :sch_9 "SCH.9" ;duration
   :sch_10 "SCH.10" ;duration_unit
   :accession_number "SCH.2"
   :appointment_time "SCH.11.4 DT"

   :ca_attending_id "PV1.7.1"
   :ca_attending_id_type (constantly "UID")
   :ca_attending_person_name (hl7/format-name "PV1.7.2-5")
   :ca_attending_system (constantly "NPI")
   :ca_attending_metasite (constantly "National Provider Identifier Registry")

   :ca_ordering_id "PV1.7.1"
   :ca_ordering_id_type (constantly "UID")
   :ca_ordering_person_name (hl7/format-name "PV1.7.2-5")
   :ca_ordering_system (constantly "NPI")
   :ca_ordering_metasite (constantly "National Provider Identifier Registry")

   :diagnosis "SCH.7.4"
   :exam_resource "AIG.3.1"
   :exam_resource_name "AIG.3.1"
   :external_system (constantly "RIS System")
   :message_event_time "MSH.7.1 DT"
   :message_type "MSH.9.1"
   :message_type_event "MSH.9.2"
   :metasite (constantly "Customer Metasite")
   ;:order_comments "NTE.3"
   :order_number "SCH.1"
   :order_status "SCH.25"
   :pacs_external_system (constantly "PACS System")
   :pacs_metasite (constantly "PACS Metasite")
   :patient_demo_city "PID.11.3"
   :patient_demo_country "PID.11.6"
   :patient_demo_county_code "PID.12"
   :patient_demo_postal_code "PID.11.5"
   :patient_demo_primary_phone "PID.13.1"
   :patient_demo_secondary_phone "PID.14.1"
   :patient_demo_social "PID.19"
   :patient_demo_state_or_province "PID.11.4"
   :patient_demo_street_address "PID.11.1"
   :patient_demo_street_address_other "PID.11.2"
   :patient_dob "PID.7.1 D"
   :patient_empi "PID.2.1"
   :patient_gender "PID.8"
   :patient_location "PV1.3.1"
   :patient_location_bed "PV1.3.3"
   :patient_location_room "PV1.3.2"
   :patient_mrn "PID.3.1"
   :patient_mrn_external_system (constantly "ADT System")
   :patient_name "PID.5.1-6 ^"
   :patient_type "PV1.2"
   :procedure_code "AIS.3"
   :site "AIL.3.4"
   :site_class_external_system (constantly "ADT System")
   :visit_number "PID.18.1"
   :visit_number_external_system (constantly "ADT System")
   })

(def msg-extractor (hl7/make-message-extractor config))

(defn do-processing [[msg-str]]
  (let [msg (hl7/parse-message msg-str)
	pmsg (msg-extractor msg)
	return {:variables pmsg
		:payload pmsg}]
    [(json/json-str return)]))

(server/process-message #'do-processing)
