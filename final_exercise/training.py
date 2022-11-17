import joblib
import os

from sklearn import svm
from sklearn import datasets


def load_dataset():
    iris = datasets.load_iris()
    X, y = iris.data, iris.target
    return X, y

def train(X, y):
    clf = svm.SVC(gamma='scale')
    clf.fit(X, y)

    return clf

def save_model(clf):
    os.makedirs("model", exist_ok=True)
    joblib.dump(clf, "model/iris_classifier.joblib")


if __name__  == "__main__":
    X, y = load_dataset()
    clf = train(X, y)
    save_model(clf)
