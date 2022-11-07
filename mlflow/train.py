import mlflow
import os

from sklearn import svm
from sklearn import datasets

MLFLOW_TRACKING_URL = os.getenv("MLFLOW_TRACKING_URL", "http://127.0.0.1:5000")
MLFLOW_EXPERIMENT_NAME = os.getenv("MLFLOW_EXPERIMENT_NAME", "iris-classifier")


mlflow.set_tracking_uri(MLFLOW_TRACKING_URL)
mlflow.set_experiment(MLFLOW_EXPERIMENT_NAME)

# Load training data set
iris = datasets.load_iris()
X, y = iris.data, iris.target

mlflow.sklearn.autolog()

# Train the model
clf = svm.SVC(gamma='scale')
clf.fit(X, y)

