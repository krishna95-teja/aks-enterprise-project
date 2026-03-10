# main terraform config file for dev environment
# rg is first defined, follwed by vnet, subnet, aks cluster, cluster identity & network profile 

data "azurerm_resource_group" "aks_rg_dev" {
    name = "rg-aks-dev"
}

resource "azurerm_virtual_network" "aks_vnet_dev" {
    name = var.vnet_dev
    location = data.azurerm_resource_group.aks_rg_dev.location
    resource_group_name = data.azurerm_resource_group.aks_rg_dev.name
    address_space = ["10.0.0.0/16"]
    dns_servers = ["10.0.0.4", "10.0.0.5"]
}

#Define Subnet block separately for better reference to subnet_id in aks block
resource "azurerm_subnet" "aks_subnet_dev" {
    name = "aks_subnet1_dev"
    resource_group_name = data.azurerm_resource_group.aks_rg_dev.name
    virtual_network_name = azurerm_virtual_network.aks_vnet_dev.name
    address_prefixes = ["10.0.1.0/24"]
}


resource "azurerm_kubernetes_cluster" "aks_dev" {
    name = var.aks_name
    resource_group_name = data.azurerm_resource_group.aks_rg_dev.name
    location = data.azurerm_resource_group.aks_rg_dev.location
    dns_prefix = "aksdev"
    default_node_pool {
        name = "default"
        node_count = 2
        vm_size = "Standard_D2s"
        vnet_subnet_id = azurerm_subnet.aks_subnet_dev.id
    }

    identity {
        type = "SystemAssigned"
    }

    network_profile {
        network_plugin = "azure"              # Available CNI plugins are azure/kubenet
        service_cidr   = "10.2.0.0/16"
        dns_service_ip = "10.2.0.10"
    }

    tags = {
        environment = "dev"
    }

}
