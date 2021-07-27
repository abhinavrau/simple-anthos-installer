# ingress-dns 

Creates [Google-managed DNS Record](https://cloud.google.com/endpoints/docs/openapi/cloud-goog-dns-configure) using Endpoints. This automates configuring Ingress with Istio as documented here: https://cloud.google.com/architecture/exposing-service-mesh-apps-through-gke-ingress#configure_ip_addressing_and_dns 

The domain name created will be `${environment_name}.frontend.endpoints.${project_id}.cloud.goog`



