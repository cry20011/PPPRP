curl -v -HHost:app.example.com --resolve "app.example.com:$SECURE_INGRESS_PORT:$INGRESS_HOST" \
  --cacert certs/example.com.crt --cert certs/client.example.com.crt --key certs/client.example.com.key \
  "https://app.example.com:$SECURE_INGRESS_PORT/api/data"