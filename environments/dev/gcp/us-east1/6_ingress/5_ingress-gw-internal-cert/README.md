# gateway-cert

Creates and installs a self-signed ingress gateway certificate as a k8s secret as described here: https://cloud.google.com/architecture/exposing-service-mesh-apps-through-gke-ingress#provision_a_tls_certificate 

In other words these modules create and install the `Internal certificate` seen in the diagram below.

![](/images/exposing-service-mesh-apps-through-gke-ingress-security.svg)