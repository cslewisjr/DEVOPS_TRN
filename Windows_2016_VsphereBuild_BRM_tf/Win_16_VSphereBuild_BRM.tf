/*Windows 2016 Build Merchant v0.01*/

##################################################################################
# PROVIDERS
##################################################################################
/*Configure VmWare Provider*/

provider "vsphere" {
    vsphere_server = "${var.vsphere_vcenter}"
    user = "${var.vsphere_user}"
    password = "${var.vsphere_password}"

    # Permit a self-signed cert
    allow_unverified_ssl = true
}
##################################################################################
# RESOURCES-VCenter BUILD OUT
##################################################################################
/*Configure DataCenter settings:*/

data "vsphere_datacenter" "dc" {
  name          = "${var.vsphere_datacenter}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"

}
data "vsphere_compute_cluster" "cluster" {
  name          = "${var.vsphere_cluster}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vsphere_port_group}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

##################################################################################
# RESOURCES-Instance Build OUT
##################################################################################

data "vsphere_virtual_machine" "template" {
  name          = "${var.vsphere_vm_template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
resource "vsphere_virtual_machine" "vm" {
  name             = "${var.vsphere_vm_name}"
  #resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = "${var.vsphere_vcpu_number}"
  memory   = "${var.vsphere_memory_size}"
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"
  
  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"  # using template adapter type
  }

  disk {
    #label = "${var.vsphere_disk0_name}"
    label = "disk0"
    #size  = "${var.vsphere_disk0_size}"  # Custom disk size
    size  = "${data.vsphere_virtual_machine.template.disks.0.size}"  # use the template size
    #eagerly_scrub = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  disk {
    unit_number = 1
    label = "${var.vsphere_disk1_name}"
    size  = "${var.vsphere_disk1_size}"  # Custom disk size
    #size  = "${data.vsphere_virtual_machine.template.disks.0.size}"  # use the template size
    #eagerly_scrub = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }


   clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      windows_options {
        computer_name = "${var.vsphere_hostname}"
        # workgroup = "terraform"
        join_domain = "${var.vsphere_domain}"
        domain_admin_user = "${var.vsphere_user}"
        domain_admin_password = "${var.vsphere_password}"
      }

      network_interface {
        ipv4_address = "${var.vsphere_ipv4_address}"
        ipv4_netmask = "${var.vsphere_ipv4_netmask}"
        dns_server_list = "${var.vsphere_dns_servers}"
      }

      ipv4_gateway = "${var.vsphere_ipv4_gateway}"
    }
  }

    connection { ### add this for the ability to run post install scripts
    type     = "winrm"
    user     = "${var.vsphere_user}"
    password = "${var.vsphere_password}"
    timeout  = "30m"
  }

  provisioner "file" { ### add this to copy the install batch file to the server
    source      = "D:\\Tools\\Hardening\\Splunk\\v7.0.4\\splunk-installx64-SWE(MAN).bat"
    destination = "C:\\scripts\\splunk.bat"
  }

  provisioner "remote-exec" { ### add this to run the install batch file
    inline = [
      "cmd.exe /c C:\\scripts\\splunk.bat"
    ]
  }
}

