import bentoml
import pandas as pd
from bentoml.io import JSON
from pydantic import BaseModel
from typing import Dict


class Iris(BaseModel):
    sepal_length: float
    sepal_width: float
    petal_length: float
    petal_width: float


model_1 = bentoml.models.get("iris_clf:latest")

runner_1 = model_1.to_runner()

service = bentoml.Service("iris_classifier", runners=[runner_1])

flowers =  ['setosa', 'versicolor', 'virginica']

@service.api(input=JSON(pydantic_model=Iris),
        output=JSON())
async def classify_1(input_data: Iris) -> Dict[str, str]:
    input_df = pd.DataFrame([input_data.dict()])
    result = await runner_1.predict.async_run(input_df)
    return {"prediction": flowers[result[0]] , "model": model_1.tag}

