import numpy as np
import bentoml
from bentoml.io import NumpyNdarray

iris_clf_runner = bentoml.sklearn.get("iris_clf:latest").to_runner()

svc = bentoml.Service("iris_classifier", runners=[iris_clf_runner])

@svc.api(input=NumpyNdarray(dtype=float, enforce_dtype=True, shape=(1, 4), enforce_shape=True),
        output=NumpyNdarray(dtype=int, enforce_dtype=True, shape=(1,), enforce_shape=True))
def classify(input_series: np.ndarray) -> np.ndarray:
    result = await iris_clf_runner.predict.run(input_series)
    return result
