#!/bin/bash
source /servers/harbinger/harbinger/deployment/utils.sh
start_log
echo '================================================================================' | tee -a $LOGFILE
echo 'Stopping GlassFish, Indexer, and Data Manager, dropping database...' | tee -a $LOGFILE
echo '================================================================================' | tee -a $LOGFILE
sudo /etc/init.d/glassfish stop
sudo /etc/init.d/data_manager stop
sudo stop harbinger-indexer
cd /servers/harbinger/harbinger/data-model/deployment
./drop-load-db.sh
if [ $? != 0 ]; then
    echo "Unable to drop and reload a clean database." | tee -a $LOGFILE
    exit 1
fi
echo '================================================================================' | tee -a $LOGFILE
echo 'Reloading Database and Core Site Data...' | tee -a $LOGFILE
echo '================================================================================' | tee -a $LOGFILE
cd /servers/harbinger/harbinger/deployment/
./restore-site-config.sh
if [ $? != 0 ]; then
    echo "Unable to restore site config tables" | tee -a $LOGFILE
    exit 1
fi
./restore-etl-handlers.sh
if [ $? != 0 ]; then
    echo "Unable to restore ETL handlers table" | tee -a $LOGFILE
    exit 1
fi
echo '================================================================================' | tee -a $LOGFILE
echo 'Done.  Do not forget to start Data Manager and GlassFish.' | tee -a $LOGFILE
echo '================================================================================' | tee -a $LOGFILE
end_log
