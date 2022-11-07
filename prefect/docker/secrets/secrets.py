from prefect import flow, task
from prefect.blocks.system import Secret

SECRETS = {
    "mlflow-tracking-url": "http://mlflow:5000",
    "mlflow-experiment-name": "iris-prefect",
    "secret-key": "miniopass",
    "access-key": "minio",
    "endpoint-url": "minio:9000",
    "bucket": "models",
}

@task
def add_secret_block(secret, value):
    Secret(value=value).save(name=secret)


@flow
def main():
    for secret, value in SECRETS.items():
        add_secret_block(secret, value)
