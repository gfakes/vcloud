;; Handler for ADT Events:
;;  - A01 (Patient Admit)
;;  - A02 (Patient Transfer)
;;  - A03 (Patient Discharge)
;;  - A04 (Patient Register)
;;  - A05 (Patient Pre-Admit)
;;  - A06 (Patient Change an Outpatient to an Inpatient (Admit))
;;  - A07 (Patient Change an Inpatient to an Outpatient (Cancel Admit))
;;  - A11 (Patient Cancel Admit)
;;  - A13 (Patient Cancel Discharge)

(ns harbinger.et.config.patient-ADT-event
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
   :patient_demo_patient_type "PV1.2"
   :patient_demo_postal_code "PID.11.5"
   :patient_demo_primary_phone "PID.13"
   :patient_demo_secondary_phone "PID.14"
   :patient_demo_social "PID.19"
   :patient_demo_state_or_province "PID.11.4"
   :patient_demo_street_address "PID.11.1"
   :patient_demo_street_address_other "PID.11.2"
   :patient_dob "PID.7.1 D"
   :patient_event_time "EVN.2 DT"
   :patient_gender "PID.8"
   :patient_location "PV1.3.1"
   :patient_location_bed "PV1.3.3"
   :patient_location_room "PV1.3.2"
   :patient_mrn "PID.3.1"
   :patient_name "PID.5"
   :patient_type "PV1.2"
   :visit_number "PID.18"
   })

(def event-mappings
  {"A01" "admit"
   "A02" "transfer"
   "A03" "discharge"
   "A04" "register"
   "A05" "pre-admit"
   "A06" "admit"
   "A07" "cancel admit"
   "A11" "cancel admit"
   "A13" "cancel discharge"
   })

(def msg-extractor (hl7/make-message-extractor config))

(defn add-event-type [pmsg]
  (assoc pmsg :patient_event_type (get event-mappings (:message_type_event pmsg))))

(defn do-processing [[msg-str]]
  (let [msg (hl7/parse-message msg-str)
	pmsg (add-event-type (msg-extractor msg))
        return {:variables pmsg
		:payload pmsg}]
    [(json/json-str return)]))

(server/process-message #'do-processing)
