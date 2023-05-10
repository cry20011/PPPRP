# PPPRP task2

Два java приложения, первое обращается ко второму и просто отдает то что пришло со второго, второе обращается на http://httpbin.org/get и тоже просто перекидывает данные.

Запускал всё под встроенным k8s в docker desctop на windows, потому что оказывается egress не работает нормально в minikube. 

Внедрение istio и применение всех .yaml файлов: 

    ./task2_istio.sh

Создание сертификатов:

    ./make_certs_secrets.sh
    
Curl запрос к приложению (нужно задать переменные и INGRESS_HOST, SECURE_INGRESS_PORT, [инструкция](https://istio.io/latest/docs/tasks/traffic-management/ingress/ingress-control/#determining-the-ingress-ip-and-ports)):

    ./tls_curl.sh

