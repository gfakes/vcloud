;; Route all hl7 messages with basic information attached

(ns harbinger.et.config.default-type-extractor
  (:require [harbinger.et.hl7 :as hl7]
	    [clojure.data.json :as json]
            [clojure.string]
            [harbinger.et.server :as server]))

(def config
  {:message_type "MSH.9.1"
   :message_type_event "MSH.9.2"})

(def msg-extractor (hl7/make-message-extractor config))

(defn do-processing [[msg-str]]
  (let [msg (try (hl7/parse-message msg-str)
                 (catch Exception e
                   ::error-parsing))
        [msg msg-str] (if (not= msg ::error-parsing)
                        [msg msg-str]
                        (let [msg-str (clojure.string/replace msg-str
                                  (java.util.regex.Pattern/compile
                                   (str "\\r(?![A-Z][A-Z0-9][A-Z0-9]"
                           (java.util.regex.Pattern/quote (second (re-find #"MSH(.).{4}\1"
                             msg-str)))")")) " ")]
                          [(hl7/parse-message msg-str) msg-str]))
	pmsg (msg-extractor msg)
	return {:variables pmsg
		:payload msg-str}]
    [(json/json-str return)]))

(server/process-message #'do-processing)
