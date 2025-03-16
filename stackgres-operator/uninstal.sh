# config map
kubectl get configmap -l app=StackGresCluster -o name -n default | xargs kubectl delete
# helm
helm delete stackgres-operator --namespace stackgres
release "stackgres-operator" uninstalled
# deployment
kubectl get deployments -n stackgres -o name | xargs kubectl delete -n stackgres
# CRDS
kubectl get crds -o name | egrep stackgres.io | xargs kubectl delete
# Cluster Role Bindings
kubectl get clusterrolebinding -o name | grep stackgres- | xargs kubectl delete
# Cluster Roles
kubectl get clusterrole -o name | grep stackgres- | xargs kubectl delete
# namespace
kubectl delete namespace stackgres
# other object
kubectl get mutatingwebhookconfiguration,validatingwebhookconfiguration -o name | grep stackgres- | xargs kubectl delete
# confirm
echo "remove done verify"
kubectl get all -n stackgres
