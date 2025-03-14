helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm repo update
helm install nfs-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
  --set nfs.server=10.32.1.100 \
  --set nfs.path=/mnt/nfs-share \
  --set storageClass.name=nfs-storage \
  --set storageClass.defaultClass=false

kubectl apply -f nfs-retain.yaml
kubectl apply -f nfs-delete.yaml
