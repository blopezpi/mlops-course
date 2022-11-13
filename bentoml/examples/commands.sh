bentoml serve service:svc --reload
bentoml build
bentoml containerize iris_classifier:latest
bentoml yatai login --endpoint localhost:8080 --api-token xxxx
bentoml models list
bentoml push <bento>
bentoml models push <model>
