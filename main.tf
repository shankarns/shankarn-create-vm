# Configure the VMware vSphere Provider
provider "vsphere" {
  user           = "administrator@pod4.cisco.demo"
  password       = "C1scoUC$"
  vsphere_server = "10.68.48.14" 

  # if you have a self-signed cert
  allow_unverified_ssl = true
}

# Deploy 2 linux VMs
module "example-server-linuxvm" {
  source        = "Terraform-VMWare-Modules/vm/vsphere"
  version       = "3.0.0"
  vmtemp        = "VM Template Name (Should Alrerady exist)"
  instances     = 2
  vmname        = "terraform-vm-1"
  vmrp          = "esxi/Resources - or name of a resource pool"
  dc        = "Pod4"
  cluster = "HX-2"
  datastore = "HX-Datastore3"
}
