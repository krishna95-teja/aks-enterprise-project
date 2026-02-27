# Terraform outputs

output "aks_name" { value = azurerm_kubernetes_cluster.aks_dev.name }

output "aks_resource_group" { value = data.azurerm_resource_group.aks_rg_dev.name }

output "kube_config_command" { 
    value = "az aks get-credentials --name ${azurerm_kubernetes_cluster.aks_dev.name} --resource-group ${data.azurerm_resource_group.aks_rg_dev.name}"
 }
