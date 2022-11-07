mlflow models build-docker --model-uri "runs:/<run-id>/model" --name "iris-mlflow" [--enable-mlserver]
mlflow models generate-dockerfile --model-uri "runs:/<run-id>/model"
# Abre API Rest and gRPC
docker run -p 8080:8080 -e GUNICORN_CMD_ARGS="--bind=0.0.0.0" "iris-mlflow:mlserver" 
docker run -p 8000:8000 -e GUNICORN_CMD_ARGS="--bind=0.0.0.0" "iris-mlflow"
# https://www.mlflow.org/docs/latest/models.html#built-in-deployment-tools
curl -X POST http://127.0.0.1:8000/invocations -H 'Content-Type: application/json' -d '{"inputs": [[5.9, 3, 5.1, 1.8]]}'
