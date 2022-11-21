bentoml serve service:svc --reload
bentoml build
bentoml containerize iris_classifier:latest
bentoml yatai login --endpoint localhost:8080 --api-token xxxx
bentoml models list
bentoml push <bento>
bentoml models push <model>

bentoml serve-grpc service:service --enable-reflection
grpcurl -plaintext 0.0.0.0:3000 describe
grpcurl -d @ -plaintext 0.0.0.0:3000 bentoml.grpc.v1alpha1.BentoService/Call <<EOM
{
   "apiName": "classify_1",
   "json": {
      "sepal_length": 1.0,
      "sepal_width": 1.0,
      "petal_length": 1.0,
      "petal_width": 1.0
   }
}
EOM
docker run -it --rm --network=host fullstorydev/grpcui -plaintext localhost:3000
