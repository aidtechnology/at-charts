#!/usr/bin/env bash

CHART_LIST=(hl-composer hlf-ca hlf-couchdb hlf-ord hlf-peer)

##########
# Helm   #
##########

# Initialise helm on client side only
helm init --client-only

for CHART in ${CHART_LIST[*]}
do
    HELM_LINT=$(helm lint ./${CHART} | grep "no failures")

    # Run only if we have Helm lint passing
    if [[ -z "$HELM_LINT" ]]
    then
        echo "Helm linting fails, cannot build Helm package"
        exit 126
    else
        echo "Helm linting suceeded for $CHART"
        helm dependency build ./${CHART}
        helm package ./${CHART}
    fi
done
