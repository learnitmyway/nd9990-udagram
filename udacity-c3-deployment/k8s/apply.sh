#!/usr/bin/env bash
set -e -o pipefail

kubectl apply --filename=\
aws-secret.yaml,\
backend-feed-deployment.yaml,\
backend-feed-service.yaml,\
backend-user-deployment.yaml,\
backend-user-service.yaml,\
env-configmap.yaml,\
env-secret.yaml,\
frontend-deployment.yaml,\
frontend-service.yaml,\
reverseproxy-deployment.yaml,\
reverseproxy-service.yaml

