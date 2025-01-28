# Create a VM with IIS

# Deployment Role

Terraform needs to be authenticated and authorized to deploy Azure Resources. There are several ways to authenticate Terraform, see [Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs).

In this example the terraform provider is configured with Service Principal `terraform` which has been registered in my Azure Entra ID tenant:

- The secret of Service Principal `terraform` is used by terraform to authenticate to my Azure ID tenant
- The `Contributor` role has been assigned to Service Principal `terraform` at the Subscription layer. This role give terraform the permission to create, modify and delete Azure resources in the Subscription.

**Note:** the secret of Service Principal `terraform` is valid for 6 months. After 6 months a new secret must be created and provided to variable `client_secret` in the terraform configuration.

# Deployment

```
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
terraform show
terraform destroy -auto-approve
```
