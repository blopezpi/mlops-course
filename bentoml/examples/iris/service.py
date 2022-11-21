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


model_1 = bentoml.models.get("iris_clf:jcff3ndjzstme4pw")

runner_1 = model_1.to_runner()

service = bentoml.Service("iris_classifier", runners=[runner_1])

flowers =  ['setosa', 'versicolor', 'virginica']

@service.api(input=JSON(pydantic_model=Iris),
        output=JSON())
async def classify(input_data: Iris) -> Dict[str, str]:
    input_df = pd.DataFrame([input_data.dict()])
    result = await runner_1.predict.async_run(input_df)
    return {"prediction": flowers[result[0]]}

