;; Handler for ADT A40 (Patient Merge - MRN Only)

(ns harbinger.et.config.patient-ADT-merge
  (:require [harbinger.et.hl7 :as hl7]
	    [clojure.data.json :as json]
            [clojure.string :as string]
            [harbinger.et.server :as server]))

(def config
  {
   :external_system (constantly "ADT System")
   :message_event_time "MSH.7 DT"
   :message_type "MSH.9.1"
   :message_type_event "MSH.9.2"
   :metasite (constantly "Customer Metasite")
   :patient_demo_city "PID.11.3"
   :patient_demo_country "PID.11.6"
   :patient_demo_county_code "PID.12"
   :patient_demo_postal_code "PID.11.5"
   :patient_demo_primary_phone "PID.13"
   :patient_demo_secondary_phone "PID.14"
   :patient_demo_social "PID.19"
   :patient_demo_state_or_province "PID.11.4"
   :patient_demo_street_address "PID.11.1"
   :patient_demo_street_address_other "PID.11.2"
   :patient_dob "PID.7.1 D"
   :patient_event_reason "EVN.4.1"
   :patient_event_time "EVN.2 DT"
   :patient_gender "PID.8"
   :patient_mrn "PID.3.1"
   :patient_name "PID.5"
   :previous_patient_mrn "MRG.1"
   :visit_number "PID.18"
   })

(def msg-extractor (hl7/make-message-extractor config))

(defn do-processing [[msg-str]]
  (let [msg (hl7/parse-message msg-str)
	pmsg (msg-extractor msg)
	return {:variables pmsg
		:payload pmsg}]
    [(json/json-str return)]))

(server/process-message #'do-processing)
