# Variables Definition File  
variable "vsphere_user" {
  description = "vSphere user name"
}

variable "vsphere_password" {
  description = "vSphere password"
}

variable "vsphere_vcenter" {
  description = "vCenter server FQDN or IP"
}

variable "vsphere_unverified_ssl" {
  description = "Is the vCenter using a self signed certificate (true/false)"
}

# VM specifications

variable "vsphere_datacenter" {
  description = "In which datacenter the VM will be deployed"
}

variable "vsphere_cluster" {
  description = "In which cluster the VM will be deployed"
}

variable "vsphere_resource_pool" {
  description = "The vCenter resource pool (default: Resources)"
  default = "/Resouces"
}

variable "vsphere_vm_name" {
  description = "What is the name of the VM"
}

variable "vsphere_vm_template" {
  description = "Where is the VM template located"
}

variable "vsphere_vm_folder" {
  description = "In which folder the VM will be store"
}


variable "vsphere_vcpu_number" {
  description = "How many vCPU will be assigned to the VM (default: 1)"
  default     = "1"
}

variable "vsphere_memory_size" {
  description = "How much RAM will be assigned to the VM (default: 1024)"
  default     = "1024"
}

variable "vsphere_disk0_name" {
  description = "What should the label be for disk 0 (default: disk0)"
  default     = "disk0"
}

variable "vsphere_disk0_size" {
  description = "What size (in GB) is disk 0 (default: 20)"
  default     = "20"
}

variable "vsphere_disk1_name" {
  description = "What should the label be for disk 1 (default: disk1)"
  default     = "disk1"
}

variable "vsphere_disk1_size" {
  description = "What size (in GB) is disk 1 (default: 20)"
  default     = "20"
}

variable "vsphere_datastore" {
  description = "What is the name of the VM datastore"
}

variable "vsphere_port_group" {
  description = "In which port group the VM NIC will be configured (default: VM Network)"
  default     = "VM Network"
}

variable "vsphere_hostname" {
  description = "What is the system name/hostname"
}

variable "vsphere_ipv4_address" {
  description = "What is the IPv4 address of the VM"
}

variable "vsphere_ipv4_netmask" {
  description = "What is the IPv4 netmask of the VM (default: 24)"
  default     = "24"
}

variable "vsphere_ipv4_gateway" {
  description = "What is the IPv4 gateway of the VM"
}

variable "vsphere_dns_servers" {
  type    = "list"
  description = "What are the DNS servers of the VM"
}

variable "vsphere_domain" {
  description = "What is the domain of the VM"
}

variable "vsphere_time_zone" {
  description = "What is the timezone of the VM (default: UTC)"
  default     = "UTC"
}
# end of file
