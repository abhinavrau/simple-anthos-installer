# Integration Test for Ingress

Terratest Integration tests that verifies that Ingress is installed correctly with Anthos Service Mesh. It does this by doing the following:

- Enables side car injection in the default namespace
- Installs the [whereami](https://github.com/GoogleCloudPlatform/kubernetes-engine-samples/tree/master/whereami) app with backend and frontend pods.

- Verifies side car injection by checking the container count of the whereami app pods.
- Verify Ingress service `gke-ingress` is available 
- Use the Ingress Load Balancer IP to do a HTTP GET request on the whereami app endpoint.

