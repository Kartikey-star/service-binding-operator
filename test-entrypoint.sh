#!/usr/bin/env bash
git clone "${SBO_REPO}" ${SBO_DIR}
git checkout "${SBO_REPO_COMMIT}"
kubectl apply -f ${SBO_DIR}/test-chart/secret.yaml --wait
kubectl apply -f ${SBO_DIR}/test-chart/application.yaml
kubectl apply -f ${SBO_DIR}/test-chart/sbo.yaml --wait
InjectionReady=`kubectl get sbr test-sbo-chart-binding --output="jsonpath={.status}" | jq '.conditions[2].status'`
Ready=`kubectl get sbr test-sbo-chart-binding --output="jsonpath={.status}" | jq '.conditions[0].status'`
CollectionReady=`kubectl get sbr test-sbo-chart-binding --output="jsonpath={.status}" | jq '.conditions[0].status'`
if [InjectionReady="true" && Ready=="true" && CollectionReady=="true"];then
echo "Success"
else
echo "Failure"
fi