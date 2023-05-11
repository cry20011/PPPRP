kubectl create namespace mesh-external

kubectl create -n mesh-external secret tls nginx-server-certs --key mtls-nginx.mesh-external.svc.cluster.local.key --cert mtls-nginx.mesh-external.svc.cluster.local.crt
kubectl create -n mesh-external secret generic nginx-ca-certs --from-file=app.com.crt

kubectl create configmap nginx-configmap -n mesh-external --from-file=nginx.conf=./nginx.conf