#!/bin/sh

kubectl label namespace default istio-injection=enabled

kubectl delete -f first_app.yaml
kubectl delete -f second_app.yaml
kubectl delete -f ingress_gateway.yaml
kubectl delete -f ingress_virtual_service.yaml
kubectl delete -f egress_service_entry.yaml
kubectl delete -f egress_gateway.yaml
kubectl delete -f egress_virtual_service.yaml

kubectl apply -f first_app.yaml
kubectl apply -f second_app.yaml
kubectl apply -f ingress_gateway.yaml
kubectl apply -f ingress_virtual_service.yaml
kubectl apply -f egress_service_entry.yaml
kubectl apply -f egress_gateway.yaml
kubectl apply -f egress_virtual_service.yaml
