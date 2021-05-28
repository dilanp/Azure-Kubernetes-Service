# Create Azure AD Group in Active Directory for AKS Admins
resource "azuread_group" "aks_administrators" {
  display_name = "${azurerm_resource_group.aks_rg.name}-cluster-administrators"
  description  = "Azure AKS Kubernetes administrators for the ${azurerm_resource_group.aks_rg.name}-cluster."
}

# Create an admin user - taksadmin1
resource "azuread_user" "taksadmin1" {
  given_name          = "taks"
  surname             = "admin1"
  user_principal_name = "taksadmin1@udfpereragmail.onmicrosoft.com"
  display_name        = "taksadmin1"
  mail_nickname       = "taksadmin1"
  password            = "@AKSadmin11"
}

# Add the admin user (taksadmin1) to the AKS Admins group.
resource "azuread_group_member" "example" {
  group_object_id  = azuread_group.aks_administrators.id
  member_object_id = azuread_user.taksadmin1.object_id
}