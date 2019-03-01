#!/usr/bin/env bash

CHART_LIST=(hl-composer hlf-ca hlf-couchdb hlf-ord hlf-peer)

for CHART in ${CHART_LIST[*]}
do
    curl --data-binary "@$CHART-$CHART_VERSION.tgz" https://${CHARTMUSEUM_URL}/api/charts --user ${CHARTMUSEUM_USER}:${CHARTMUSEUM_PASS}
done
