### THIS IS UNFINISHED / WIP

# vCenter connection Info
vsphere_vcenter = "brmsweinfvcs01.transfirstswe.net"
# This file needs to be Encrypted via Hashicorp or Ansible Vault (or other means TBD)
vsphere_user = "" # ALWAYS REMOVE THESE ENTRIES BEFORE COMMITING TO GIT
vsphere_password = "" # ALWAYS REMOVE THESE ENTRIES BEFORE COMMITING TO GIT
vsphere_password = "L@Tr3asha66" # ALWAYS REMOVE THESE ENTRIES BEFORE COMMITING TO GIT
vsphere_unverified_ssl = "true"

# VM specifications
vsphere_datacenter = "Broomfield SWE"
vsphere_cluster = "SWE_INF01"
vsphere_resource_pool = "Terraform"

vsphere_vm_folder = "Security"
vsphere_vm_name = "Bgann-TF-First"
vsphere_vm_folder = "Terraform"
vsphere_vm_name = "BRMSWETSTPOC01"
#vsphere_vm_template = "SWE_INF01/TEMPLATES/2016_Server_Core"   
vsphere_vm_template = "SWE_INF01/Terraform/Windows2016_Terraform_template_silver2"
#vsphere_vm_template = "SWE_INF01/TEMPLATES/Windows10_Template"

vsphere_vcpu_number = "2"
vsphere_memory_size = "4096"
vsphere_disk0_name = "disk0"
vsphere_disk0_size = "80"
vsphere_disk1_name = "disk1"
vsphere_disk1_size = "20"

vsphere_datastore = "brm-swe-vdi-persona-01"
vsphere_port_group = "SWE_Infrastructure-10.250.5.x (VLAN 5)"
vsphere_hostname = "BRMSWETSTPOC01"
vsphere_ipv4_address = "10.250.5.213"
vsphere_ipv4_netmask = "24"
vsphere_ipv4_gateway = "10.250.5.1"
vsphere_dns_servers = ["10.250.5.11", "10.250.5.12"]
vsphere_domain = "transfirstswe.net"
vsphere_time_zone = "UTC"
