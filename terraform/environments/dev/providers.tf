# 'terraform' providers code for aks-dev infra
terraform {
    required_version = "~> 1.6"

    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"               # azurerm provider downloaded during terraform init
            version = "~> 3.100"
        }
    }

    #Backend should always be inside 'terraform' block
    backend "azurerm" {
        use_azuread_auth = true
    }

}

provider "azurerm" {
    features {}
}
