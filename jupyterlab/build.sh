wget https://archive.apache.org/dist/spark/spark-3.5.0/spark-3.5.0-bin-hadoop3.tgz
tar -xzvf spark-3.5.0-bin-hadoop3.tgz
cd spark-3.5.0-bin-hadoop3
./bin/docker-image-tool.sh -r 10.32.1.100:9443/spark -t v3.5 -u root -p kubernetes/dockerfiles/spark/bindings/python/Dockerfile build
docker push 10.32.1.100:9443/spark/spark-py:v3.5
docker build -t 10.32.1.100:9443/jupyterlab:spark-k8s -f Dockerfile .
docker push 10.32.1.100:9443/jupyterlab:spark-k8s
docker build -t 10.32.1.100:9443/jupyterlab:spark-k8s-jupyter -f Dockerfile.jupyter .
docker push 10.32.1.100:9443/jupyterlab:spark-k8s-jupyter
kubectl create ns jupyterlab
kubectl create serviceaccount spark-driver -n jupyterlab
kubectl create clusterrolebinding spark-driver-rb --clusterrole=cluster-admin --serviceaccount=jupyterlab:spark-driver
