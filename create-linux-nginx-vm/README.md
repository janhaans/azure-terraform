# Create a Linux VM with NGINX

# Deployment Role

Terraform needs to be authenticated and authorized to deploy Azure Resources. There are several ways to authenticate Terraform, see [Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs).

In this example the terraform provider is configured with Service Principal `terraform` which has been registered in my Azure Entra ID tenant:

- The secret of Service Principal `terraform` is used by terraform to authenticate to my Azure ID tenant
- The `Contributor` role has been assigned to Service Principal `terraform` at the Subscription layer. This role gives terraform the permission to create, modify and delete Azure resources in the Subscription.

**Note:** the secret of Service Principal `terraform` is valid for 6 months. After 6 months a new secret must be created and provided to variable `client_secret` in the terraform configuration.

# Deployment

The terraform template will deploy:

- Resource Group
- Virtual Network (VNET) and Subnet
- Standard Public IP
- Network Security Group (NSG) that allows inbound SSH and HTTP
- Associate NIC with NSG and Public IP
- SSH key, the SSH key-pair will be saved to local file
- Linux Virtual Machine (VM) and use public SSH key for authentication
- Associate VM with NIC
- Install Nginx on VM using Custom Script Extension and bash script in [Github](https://raw.githubusercontent.com/MicrosoftDocs/mslearn-welcome-to-azure/master/configure-nginx.sh)

```
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
terraform show
terraform destroy -auto-approve
```

# Post actions

In the browser go to the public IP address.
