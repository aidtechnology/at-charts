# Upgrading from version 1.1.x and up.

## Secret creation

Specify which release we want to work with:

```
export RELEASE='ord1'
export POD_NAME=$(kubectl get pods -l "app=hlf-ord,release=${RELEASE}" -o jsonpath="{.items[0].metadata.name}")
```

### Cred secret

Get relevant credentials

```
export CA_USERNAME=$(kubectl get secret ${RELEASE}-hlf-ord -o jsonpath="{.data.CA_USERNAME}" | base64 --decode; echo)
export CA_PASSWORD=$(kubectl get secret ${RELEASE}-hlf-ord -o jsonpath="{.data.CA_PASSWORD}" | base64 --decode; echo)
 ```

Save credentials in secret

```
kubectl create secret generic hlf--${RELEASE}-cred --from-literal=CA_USERNAME=$CA_USERNAME --from-literal=CA_PASSWORD=$CA_PASSWORD
```

### Cert secret

Get content of certificate file

```
export CONTENT=$(kubectl exec $POD_NAME -- cat /var/hyperledger/msp/signcerts/cert.pem)
```

Create certificate secret

```
kubectl create secret generic hlf--${RELEASE}-cert --from-literal=cert.pem=$CONTENT
```

### Key secret

Get content of key file

```
export CONTENT=$(kubectl exec $POD_NAME -- bash -c 'cat /var/hyperledger/msp/keystore/*_sk')
```

Create certificate secret

```
kubectl create secret generic hlf--${RELEASE}-key --from-literal=key.pem=$CONTENT
```

### CA cert secret

Get content of key file

```
export CONTENT=$(kubectl exec $POD_NAME -- bash -c 'cat /var/hyperledger/msp/cacerts/*.pem')
```

Create certificate secret

```
kubectl create secret generic hlf--${RELEASE}-cacert --from-literal=cacert.pem=$CONTENT
```

### Intermediate CA cert secret

Get content of key file

```
export CONTENT=$(kubectl exec $POD_NAME -- bash -c 'cat /var/hyperledger/msp/intermediatecerts/*.pem')
```

Create certificate secret

```
kubectl create secret generic hlf--${RELEASE}-intcacert --from-literal=intermediatecacert.pem=$CONTENT
```

## Upgrade the chart

You will need to update the chart to the latest version by editing the relevant values files:

```
secrets:
  ord:
    cred: hlf--ord1-cred
    cert: hlf--ord1-idcert
    key: hlf--ord1-idkey
    caCert: hlf--ord1-cacert
    intCaCert: hlf--ord1-caintcert
```

And running:

```
helm upgrade ${RELEASE} ./hlf-ord
```
