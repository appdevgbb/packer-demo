variable "client_id" {
	type = string
}

variable "client_secret" {
	type = string
}

variable "resource_group_name" {
	type = string
}

variable "storage_account" {
	type = string
}

variable "arm_subscription_id" {
	type = string
}

variable "arm_tenant_id" {
	type = string
}


variable "os_type" {
	type = string
	default = "Linux"  
}

variable "image_publisher" {
	type = string
	default = "Canonical"
}

variable "image_offer" {
	type = string
	default = "UbuntuServer"
}

variable "image_sku" {
	type = string
	default = "18.04-LTS"
}

variable "location" {
	type = string
}

variable "vm_size" {
	type = string
	default = "Standard_D4s_v3"
}

variable "arm_subscription_id" {
	type = string
}

variable "shared_image_gallery_resource_group_name" {
	type = string
}

variable "gallery_name" {
	type = string
}

variable "shared_image_name" {
	type = string
}

variable "shared_image_version" {
	type = string
}

variable "managed_image_name" {
	type = string
}

variable "managed_image_resource_group_name" {
	type = string
}

source "azure-arm" "basic-example" {
  client_id = var.client_id
  client_secret = var.client_secret 
  resource_group_name = var.resource_group_name 
  storage_account = var.storage_account 
  subscription_id = var.subscription_id 
  tenant_id = var.tenant_id 

  capture_container_name = "images"
  capture_name_prefix = "packer"

  os_type = var.os_type
  image_publisher = var.image_publisher
  image_offer = var.image_offer
  image_sku = var.image_sku

  location = var.location
  vm_size = var.vm_size

	shared_image_gallery {	
    subscription = var.arm_subscription_id
    resource_group = var.shared_image_gallery_resource_group_name
    gallery_name = var.gallery_name
    image_name = var.shared_image_name
    image_version = var.shared_image_version
	}

	managed_image_name = var.managed_image_name
	managed_image_resource_group_name = var.managed_image_resource_group_name
}

build {
  sources = ["sources.azure-arm.basic-example"]
}