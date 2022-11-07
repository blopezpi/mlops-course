prefect config set PREFECT_API_URL=http://127.0.0.1:4200/api
prefect deployment build ./task.py:main -n iris_classifier -t docker -ib docker-container/docker -sb remote-file-system/minio -q docker -v v1 -o prefect-deployment.yaml --path iris
prefect deployment apply main-deployment.yaml
prefect agent start -q 'docker'

#Configuring Minio
#{
#  "key": "minio",
#  "secret": "miniopass",
#  "client_kwargs": {
#    "endpoint_url": "http://minio:9000"
#  }
#}

# Docker add network (prefect_netw) and add minio to the /etc/host
#{
#  "EXTRA_PIP_PACKAGES": "s3fs mlflow scikit-learn==1.1.2 minio joblib matplotlib boto3",
#  "AWS_ACCESS_KEY_ID": "minio",
#  "AWS_SECRET_ACCESS_KEY": "miniopass",
#  "MLFLOW_S3_ENDPOINT_URL": "http://minio:9000"
#}

