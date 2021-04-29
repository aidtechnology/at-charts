# Upgrade Fabric from version 1.3.0 to 1.4.1

1. Update image tag from 1.3.0 to 1.4.1 in values.yaml

2. Update version from 1.2.6 to 1.2.7 in Chart.yaml

3. Update appVersion from 1.3.0 to 1.4.1 in Chart.yaml

4. Variable to update

    * CORE_LOGGING_LEVEL > FABRIC_LOGGING_SPEC

5. Variables to add

    * CORE_PEER_CHAINCODEADDRESS

    * CORE_PEER_CHAINCODELISTENADDRESS
