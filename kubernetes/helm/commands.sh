helm --help
helm create --help
helm create breast_cancer
helm template --help
helm template .
helm template breast_cancer breast_cancer/
helm template breast_cancer/ -f values-custom.yaml 
helm upgrade --install breast_cancer/ -f values-custom.yaml -n breast
helm upgrade --install local breast_cancer/ -f values-custom.yaml -n breast
helm list 
helm delete breast
helm list -n breast
helm history local -n breast
helm rollback 7 local -n breast
helm rollback --help
helm rollback local 7 -n breast
helm history local -n breast
helm rollback local 8 -n breast
helm diff --help
helm diff revision --help
helm diff revision local 9 10 -n breast
helm get --help
helm get values local -n brest
helm get manifest local -n breast
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
cat ~/.cache/helm/repository/bitnami-index.yaml
helm search repo wordpress
helm search repo bitnami/wordpress --versions
helm install mi-wordpress bitnami/wordpress --version=15.1.5
helm uninstall mi-wordpress 
helm package breast_cancer/
helm registry login registry-1.docker.io
helm push breast-cancer-0.1.0.tgz oci://registry-1.docker.io/blopezp007 
helm uninstall local -n breast
helm template remoto oci://registry-1.docker.io/blopezp007/breast-cancer --version 0.1.0 -f values-custom.yaml 
helm upgrade --install remoto oci://registry-1.docker.io/blopezp007/breast-cancer --version 0.1.0 -f values-custom.yaml 
helm list
helm template chartmuseum/breast-cancer
helm upgrade --install chartmuseum chartmuseum/breast-cancer  -f values-custom.yaml
helm list
helm uninstall chartmuseum
helm create exercise3
helm template exercise3/ -f values-custom-exercise3.yaml 
helm upgrade --install exercise3 exercise3/ -f values-custom-exercise3.yaml 
helm package exercise3/
helm push exercise3-0.1.0.tgz oci://registry-1.docker.io/blopezp007 
helm uninstall exercise3
