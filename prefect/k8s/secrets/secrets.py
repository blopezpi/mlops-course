from prefect import flow, task
from prefect.blocks.system import Secret

SECRETS = {
    "secret-key": "minio123",
    "access-key": "minio",
    "endpoint-url": "minio-prefect.192.168.49.2.nip.io",
    "bucket": "models",
}

@task
def add_secret_block(secret, value):
    Secret(value=value).save(name=secret)


@flow
def main():
    for secret, value in SECRETS.items():
        add_secret_block(secret, value)
