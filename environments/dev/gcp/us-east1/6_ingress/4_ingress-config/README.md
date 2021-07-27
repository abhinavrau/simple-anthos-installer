# ingress-configs

Applies K8 config for the follwing to the GKE Cluster

- Creates Ingress resource as described here: https://cloud.google.com/architecture/exposing-service-mesh-apps-through-gke-ingress#deploy_the_ingress_resource
  
- Creates BackendConfig with Healthchecking Ingress Load Balancing as described here: https://cloud.google.com/architecture/exposing-service-mesh-apps-through-gke-ingress#deploying_gke_ingress

![](/images/exposing-service-mesh-apps-through-gke-ingress-health-checking.svg)


