helm list -A | grep nfs
helm uninstall nfs-provisioner -n default
kubectl delete clusterrole nfs-provisioner-nfs-subdir-external-provisioner-runner
kubectl delete clusterrolebinding nfs-provisioner-nfs-subdir-external-provisioner-runner
kubectl delete namespace nfs
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm repo update
helm install nfs-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
  --namespace nfs \
  --create-namespace \
  --set nfs.server=10.32.1.100 \
  --set nfs.path=/mnt/nfs-share \

kubectl apply -f nfs-retain.yaml
#kubectl apply -f nfs-delete.yaml
