mkdir certs
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/O=example Inc./CN=example.com' -keyout certs/example.com.key -out certs/example.com.crt
openssl req -out certs/app.example.com.csr -newkey rsa:2048 -nodes -keyout certs/app.example.com.key -subj "/CN=app.example.com/O=app organization"
openssl x509 -req -sha256 -days 365 -CA certs/example.com.crt -CAkey certs/example.com.key -set_serial 0 -in certs/app.example.com.csr -out certs/app.example.com.crt

kubectl create -n istio-system secret tls app-credential --key=certs/app.example.com.key --cert=certs/app.example.com.crt