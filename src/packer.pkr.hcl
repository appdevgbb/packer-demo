variable "arm_client_id" {
	type = string
}

variable "arm_client_secret" {
	type = string
	sensitive = true
}

variable "arm_subscription_id" {
	type = string
}

variable "arm_tenant_id" {
	type = string
}

variable "location" {
	type = string
}

variable "build_resource_group_name" {
	type = string
}

variable "artifact_resource_group_name" {
	type = string
}

variable "storage_account_name" {
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

variable "vm_size" {
	type = string
	default = "Standard_D4s_v3"
}

variable "shared_image_gallery_resource_group_name" {
	type = string
}

variable "shared_image_gallery_name" {
	type = string
}

variable "shared_image_name" {
	type = string
}

variable "shared_image_version" {
	type = string
}

variable "managed_image_resource_group_name" {
	type = string
}

variable "managed_image_name" {
	type = string
}

source "azure-arm" "basic-example" {
  client_id = var.arm_client_id
  client_secret = var.arm_client_secret 
  subscription_id = var.arm_subscription_id 
  tenant_id = var.arm_tenant_id
  resource_group_name = var.artifact_resource_group_name 
  storage_account = var.storage_account_name

  os_type = var.os_type
  image_publisher = var.image_publisher
  image_offer = var.image_offer
  image_sku = var.image_sku

  location = var.location
	build_resource_group_name = var.build_resource_group_name
  vm_size = var.vm_size

	managed_image_name = var.managed_image_name
	managed_image_resource_group_name = var.managed_image_resource_group_name

	shared_image_gallery_destination  {	
    subscription = var.arm_subscription_id
    resource_group = var.shared_image_gallery_resource_group_name
    gallery_name = var.shared_image_gallery_name
    image_name = var.shared_image_name
    image_version = var.shared_image_version
		replication_regions var.shared_image_replication_regions
		storage_account_type = "Standard_LRS" 
	}
}

build {
  sources = ["sources.azure-arm.basic-example"]
}