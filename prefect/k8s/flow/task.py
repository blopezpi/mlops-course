import joblib

from minio import Minio
from prefect import flow, task, get_run_logger
from prefect.blocks.system import Secret
from sklearn import svm
from sklearn import datasets


def get_minio_secret():
    secret_key = Secret.load("secret-key").get()
    access_key = Secret.load("access-key").get()
    endpoint_url = Secret.load("endpoint-url").get()
    bucket = Secret.load("bucket").get()
    return secret_key, access_key, endpoint_url, bucket

def create_bucket(client, bucket):
    found = client.bucket_exists(bucket)
    if not found:
        client.make_bucket(bucket)

@task
def load_dataset():
    logger = get_run_logger()
    logger.info("Downloading dataset")
    iris = datasets.load_iris()
    X, y = iris.data, iris.target
    return X, y

@task
def train(X, y):
    logger = get_run_logger()
    logger.info("Training model")

    clf = svm.SVC(gamma='scale')
    clf.fit(X, y)

    joblib.dump(clf, "model.joblib")

@task
def upload_model():
    logger = get_run_logger()
    logger.info("Get Minio secrets")
    secret_key, access_key, endpoint_url, bucket = get_minio_secret()
    client = Minio(
        endpoint_url,
        access_key=access_key,
        secret_key=secret_key,
        secure=False,
    )

    create_bucket(client, bucket)

    client.fput_object(
        "models", "iris/model.joblib", "model.joblib",
    )


@flow
def main():
    X, y = load_dataset()
    train(X, y)
    upload_model()
