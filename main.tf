resource "azurerm_resource_group" "limayrac" {
  name     = "limayrac-rg"
  location = "West Europe"
  tags = { environment = "Terraform", owner = "Nathan" }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-limayrac"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.limayrac.location
  resource_group_name = azurerm_resource_group.limayrac.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-limayrac"
  resource_group_name  = azurerm_resource_group.limayrac.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "pip" {
  name                = "pip-limayrac"
  location            = azurerm_resource_group.limayrac.location
  resource_group_name = azurerm_resource_group.limayrac.name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic" {
  name                = "nic-limayrac"
  location            = azurerm_resource_group.limayrac.location
  resource_group_name = azurerm_resource_group.limayrac.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-dev-nathan"
  resource_group_name = azurerm_resource_group.limayrac.name
  location            = azurerm_resource_group.limayrac.location
  size                = var.vm_size
  admin_username      = "adminuser"
  network_interface_ids = [azurerm_network_interface.nic.id]
  disable_password_authentication = false
  admin_password                  = "Limayrac2026!Nathan"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
