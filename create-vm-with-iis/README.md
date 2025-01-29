# Create a VM with IIS

# Deployment Role

Terraform needs to be authenticated and authorized to deploy Azure Resources. There are several ways to authenticate Terraform, see [Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs).

In this example the terraform provider is configured with Service Principal `terraform` which has been registered in my Azure Entra ID tenant:

- The secret of Service Principal `terraform` is used by terraform to authenticate to my Azure ID tenant
- The `Contributor` role has been assigned to Service Principal `terraform` at the Subscription layer. This role gives terraform the permission to create, modify and delete Azure resources in the Subscription.

**Note:** the secret of Service Principal `terraform` is valid for 6 months. After 6 months a new secret must be created and provided to variable `client_secret` in the terraform configuration.

# Deployment

Terraform will deploy the following Azure resources:

- Resource group
- Virtual network
- Subnet
- Public IP
- Network Interface Card (NIC)
- Network Security Group
- VM (Windows Server)
- IIS on VM (custom script)

```
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
terraform show
terraform destroy -auto-approve
```

# Post actions

- Use RDP to access Windows VM
- Test the website by going to the VM's public IP in a browser
- Open Notepad to create a new file with the content `Welcome to my initial web page` and save it as `index.html` in folder `C:\intepub\wwwroot`
- Again, test the changed website by going to the VM's public IP in a browser
