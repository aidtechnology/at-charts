# Upgrade Fabric from version 1.3.0 to 1.4.1

1. Update image tag from 1.3.0 to 1.4.1 in values.yaml

2. Variables to update

    * ORDERER_GENERAL_LOGLEVEL > FABRIC_LOGGING_SPEC

3. Variables to add

    * ORDERER_KAFKA_TOPIC_REPLICATIONFACTOR=1

    * ORDERER_KAFKA_VERBOSE=true
