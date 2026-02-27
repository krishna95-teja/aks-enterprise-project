# Terraform variables

variable "aks_name" {
    description = "Name of AKS cluster"
    type = string
}

variable "vnet_dev" {
    description = "Name of Vnet of the cluster"
    type = string
}
