#!/bin/bash

minikube start --driver=docker --addons=ingress,metrics-server,dashboard --kubernetes-version=1.24.0
helmfile apply

#{
#  "key": "minio",
#  "secret": "minio123",
#  "client_kwargs": {
#    "endpoint_url": "http://minio-prefect.192.168.49.2.nip.io"
#  }
#}

#{
#  "EXTRA_PIP_PACKAGES": "s3fs scikit-learn==1.1.2 minio joblib"
#}
# prefecthq/prefect:2.6.5-python3.9
# namespace prefect
