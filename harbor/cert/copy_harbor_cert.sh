#!/bin/bash

# Danh sách các node K8s
NODES=(
    "k8s-nva-master"
    "k8s-nva-worker1"
    "k8s-nva-worker2"
    "k8s-nva-worker3"
    "k8s-nva-worker4"
    "k8s-nva-worker5"
)

# Đường dẫn chứng chỉ nguồn trên node `k8s-nva-nfs`
SOURCE_NODE="k8s-nva-nfs"
SOURCE_CERT="/mnt/harbor/cer/harbor.crt"
DEST_CERT="/usr/local/share/ca-certificates/harbor.crt"

# Sao chép và cập nhật CA trên từng node
for NODE in "${NODES[@]}"; do
    echo "📌 Đang sao chép chứng chỉ đến $NODE..."
    rsync root@$SOURCE_NODE:$SOURCE_CERT root@$NODE:$DEST_CERT
    
    echo "🔄 Cập nhật CA trên $NODE..."
    ssh root@$NODE "update-ca-certificates"
    
    echo "✅ Hoàn thành trên $NODE!"
done

echo "🎉 Tất cả các node đã được cập nhật chứng chỉ Harbor!"

