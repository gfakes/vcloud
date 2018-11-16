(ns harbinger.et.config.rad-result
  (:require [harbinger.et.hl7 :as hl7]
	    [clojure.data.json :as json]
            [clojure.string :as str]
            [harbinger.et.server :as server]))

(def config
  {
   :accession_number "OBR.3.1"

   :ca_attending_id "PV1.7.1"
   :ca_attending_id_type (constantly "UID")
   :ca_attending_person_name (hl7/format-name "PV1.7.2-5")
   :ca_attending_system (constantly "NPI")
   :ca_attending_metasite (constantly "National Provider Identifier Registry")

   :ca_ordering_id "ORC.12.1"
   :ca_ordering_id_type (constantly "UID")
   :ca_ordering_person_name "ORC.12.2-5 ^"
   :ca_ordering_system (constantly "NPI")
   :ca_ordering_metasite (constantly "National Provider Identifier Registry")

   :ca_radiologist1_id "OBR.32.1"
   :ca_radiologist1_id_type (constantly "UID")
   :ca_radiologist1_person_name (hl7/format-name "OBR.32.2-5")
   :ca_radiologist1_system (constantly "RIS System")
   :ca_radiologist1_metasite (constantly "Customer Metasite")

   :ca_radiologist2_id "OBR.33.1"
   :ca_radiologist2_id_type (constantly "UID")
   :ca_radiologist2_person_name (hl7/format-name "OBR.33.2-5 ^")
   :ca_radiologist2_system (constantly "RIS System")
   :ca_radiologist2_metasite (constantly "Customer Metasite")

   :ca_technologist_id "OBR.34.1"
   :ca_technologist_id_type (constantly "EMP")
   :ca_technologist_person_name "OBR.34.2-3 ^"
   :ca_technologist_system (constantly "RIS System")
   :ca_technologist_metasite (constantly "Customer Metasite")

   :diagnosis "OBR.31"
   :duration "OBR.27.3"
   :begin_exam_time "OBR.7 DT"
   :end_exam_time "OBR.8 DT"
   :exam_resource "OBR.18.1"
   :exam_resource_name "OBR.18.2"
   :exam_status (hl7/with-selector [obr25 "OBR.25"] (or obr25 "unknown"))
   :external_system (constantly "ADT System")
   :message_event_time "MSH.7.1 DT"
   :message_type "MSH.9.1"
   :message_type_event "MSH.9.2"
   :metasite (constantly "Customer Metasite")
   :modality "OBR.24"
   :order_comments (hl7/with-selector [lines "NTE*.3*"] (->> lines (flatten) (string/join \newline)))   
   :order_number "OBR.2.1"
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
   :patient_location_external_system (constantly "ADT System")
   :patient_location_room "PV1.3.2"
   :patient_mrn "PID.3.1"
   :patient_mrn_external_system (constantly "ADT System")
   :patient_name "PID.5.1-6 ^"
   :patient_type "PV1.2"
   :procedure_code "OBR.4.1"
   :procedure_description "OBR.4.2"
   :report_body (hl7/with-selector [lines "OBX*.5*"] (->> lines (flatten) (str/join \newline)))
   :report_impression (hl7/get-obx-type-regex #".*IMP.*")
   :report_event_time "OBR.22 DT"
   :site "MSH.4"
   :site_class_external_system (constantly "ADT System")
   :visit_number (hl7/slz "PID.18.1")
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
