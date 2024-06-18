terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.108.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-tf-training-tfstate"
    storage_account_name = "bejotfstate"
    container_name       = "tfstate"
    key                  = "storageaccount.tfstate"
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-tf-storageaccount"
  location = "West Europe"
}

module "storageaccount1" {
  source              = "./modules/storageaccount"
  name                = "bejostorageaccount1"
  resource_group_name = azurerm_resource_group.rg.name
}

module "storageaccount2" {
  source              = "./modules/storageaccount"
  name                = "bejostorageaccount2"
  resource_group_name = azurerm_resource_group.rg.name
}