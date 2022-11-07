import pandas as pd

from fastapi import FastAPI
from utils.prediction import get_model_response
from db.client import collection
from model.models import Input, Output


app = FastAPI()

model_name = "Breast Cancer Wisconsin (Diagnostic)"
version = "v1.0.0"


@app.get('/')
async def model_info():
    """Return model information, version, how to call"""
    return {
        "name": model_name,
        "version": version
    }


@app.get('/health')
async def service_health():
    """Return service health"""
    return {
        "ok"
    }


@app.post('/predict', response_model=Output)
async def model_predict(input: Input):
    """Prediction"""
    X = pd.json_normalize(input.__dict__)

    response = get_model_response(X)

    cancer = {"inputs": input.__dict__, "prediction": response}

    collection.insert_one(cancer)

    return response
