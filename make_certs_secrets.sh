mkdir certs

openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/O=app Inc./CN=app.com' -keyout certs/app.com.key -out certs/app.com.crt

openssl req -out certs/mtls-nginx.mesh-external.svc.cluster.local.csr -newkey rsa:2048 -nodes -keyout certs/mtls-nginx.mesh-external.svc.cluster.local.key -subj "/CN=mtls-nginx.mesh-external.svc.cluster.local/O=some organization"
openssl x509 -req -sha256 -days 365 -CA certs/app.com.crt -CAkey certs/app.com.key -set_serial 0 -in certs/mtls-nginx.mesh-external.svc.cluster.local.csr -out certs/mtls-nginx.mesh-external.svc.cluster.local.crt

openssl req -out certs/client.app.com.csr -newkey rsa:2048 -nodes -keyout certs/client.app.com.key -subj "/CN=client.app.com/O=client organization"
openssl x509 -req -sha256 -days 365 -CA certs/app.com.crt -CAkey certs/app.com.key -set_serial 1 -in certs/client.app.com.csr -out certs/client.app.com.crt

kubectl create secret -n istio-system generic client-credential --from-file=tls.key=certs/client.app.com.key --from-file=tls.crt=certs/client.app.com.crt --from-file=ca.crt=certs/app.com.crt
