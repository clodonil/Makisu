#!/bin/bash

kubectl apply -f /home/clodonil/makisu/pod.yaml 
sleep 10
kubectl cp Dockerfile makisu-build-devops:/makisu-context/Dockerfile -c makisu-init 
kubectl exec makisu-build-devops -c makisu-init -- touch /tmp/complete
sleep 5
kubectl logs makisu-build-devops -f
kubectl delete pod makisu-build-devops

