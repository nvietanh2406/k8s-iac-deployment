helm repo add minio-operator https://operator.min.io
helm search repo minio-operator

# helm install \
#  --namespace datalake \
#  --create-namespace \
#  -f values.yaml \
#  operator minio-operator/operator \
#  --version 4.5.8

helm upgrade --install minio ./ -f values.yaml --namespace datalake --create-namespace
#kubectl -n datalake  get secret console-sa-secret -o jsonpath="{.data.token}" | base64 --decode
