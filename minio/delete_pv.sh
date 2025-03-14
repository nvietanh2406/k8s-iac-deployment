kubectl delete pod -n datalake minio-0
kubectl delete -f pv-nfs-retain-0.yaml 
kubectl delete pod -n datalake minio-0
kubectl delete pod -n datalake minio-1
kubectl delete -f pv-nfs-retain-1.yaml
kubectl delete pod -n datalake minio-1
kubectl delete pod -n datalake minio-2
kubectl delete -f pv-nfs-retain-2.yaml
kubectl delete pod -n datalake minio-2
kubectl delete pod -n datalake minio-3
kubectl delete -f pv-nfs-retain-3.yaml
kubectl delete pod -n datalake minio-3
kubectl get pod -n datalake 
kubectl get pvc -n datalake
kubectl get pv | grep minio

