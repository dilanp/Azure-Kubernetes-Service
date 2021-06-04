# Terraform Resource to Create Azure Resource Group with Input Variables defined in variables.tf
# Variable var.environment will be picked up from the pipeline.
resource "azurerm_resource_group" "aks_rg" {
  name = "${var.resource_group_name}-${var.environment}"
  location = var.location
}


