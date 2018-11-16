#!/bin/bash

sudo stop harbinger-indexer
cd /servers/indexer
java -cp daemon-resoures:jndi-resources:harbinger-indexer-standalone.jar clojure.main -e "(require 'harbinger-indexer.core)(harbinger-indexer.core/do-mass-index \"exit\")"
