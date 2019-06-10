# Upgrade Fabric from version 1.3.0 to 1.4.1

1. Update image tag from 1.3.0 to 1.4.1 in *values.yaml*

2. Update version from 1.1.6 to 1.1.7 in *Chart.yaml*

3. Update appVersion from 1.3.0 to 1.4.1 in *Chart.yaml*

4. Variables to add

    * FABRIC_CA_SERVER_CA_CERTFILE: /etc/hyperledger/fabric-ca-server/ca-cert.pem

    * FABRIC_CA_SERVER_CA_KEYFILE: /etc/hyperledger/fabric-ca-server/ca-key.pem
