# Kubernetes RBAC Configuration

This folder contains the Terraform configuration for setting up Kubernetes role-based access control (RBAC) for the "rearc-quest" GKE cluster. The RBAC configuration grants the necessary permissions to a service account used by the CI/CD pipeline to build, push, and deploy a Docker image to the cluster using ArgoCD.

## Resources

The following Kubernetes RBAC resources are defined in this configuration:

- `kubernetes_service_account`: Creates a service account named "quest-service-account" in the "default" namespace. This service account is used by the pipeline to authenticate and interact with the Kubernetes API.

- `kubernetes_role`: Creates a role named "quest-role" in the "default" namespace. The role grants permissions to perform various actions on Kubernetes resources required for the pipeline, such as managing pods, services, configmaps, secrets, deployments, replicasets, statefulsets, jobs, cronjobs, and ArgoCD-specific resources.

- `kubernetes_role_binding`: Creates a role binding named "quest-role-binding" in the "default" namespace. The role binding associates the "quest-role" with the "quest-service-account", granting the permissions defined in the role to the service account.

## Usage

To use this RBAC configuration, follow these steps:

1. Make sure you have the necessary Kubernetes provider configuration in the `terraform` block of your `terraform.tf` file to interact with the GKE cluster.

2. Review and adjust the permissions granted in the `kubernetes_role` resource according to your specific requirements and security policies. Ensure that the granted permissions are sufficient for your pipeline to function correctly while following the principle of least privilege.

3. If needed, update the namespace in the `metadata` blocks of the resources to match your desired namespace.

4. Run `terraform init` to initialize the Terraform configuration.

5. Run `terraform apply` to create the RBAC resources in the GKE cluster.

6. Once the RBAC resources are created, you can use the "quest-service-account" in your CI/CD pipeline to authenticate and interact with the Kubernetes API, allowing it to build, push, and deploy the Docker image to the "rearc-quest" GKE cluster using ArgoCD.

## Notes

- The RBAC configuration assumes that ArgoCD is deployed in the same cluster and has the necessary permissions to manage deployments and other resources.

- Make sure to secure the credentials and access tokens associated with the "quest-service-account" to prevent unauthorized access.

- Regularly review and update the RBAC configuration to ensure it aligns with your evolving security and access control requirements.

For more information on Kubernetes RBAC, refer to the official Kubernetes documentation: [Kubernetes RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)