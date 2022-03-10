resource "oci_core_instance" "arm_instance" {
  count = 2

  #Required
  availability_domain = local.list_of_ads[count.index % local.number_of_ads]
  compartment_id      = var.compartment_id
  shape               = var.arm_instance_shape
  display_name        = "ARM-server-${count.index}"

  shape_config {
    ocpus         = var.arm_ocpus["always_free"]
    memory_in_gbs = var.arm_memory["always_free"]
  }

  create_vnic_details {
    subnet_id      = oci_core_subnet.test_subnet.id
    hostname_label = "ARM-server-${count.index}"
    nsg_ids        = [oci_core_network_security_group.test_network_security_group.id]
  }

  source_details {
    source_id   = lookup(var.image_OL8_aarch64, var.region, "illegal region!")
    source_type = "image"
  }

  metadata = {
    ssh_authorized_keys = fileexists(var.ssh_public_key_path) ? file(var.ssh_public_key_path) : null
  }

  extended_metadata = {}

  freeform_tags = local.acme_tags
}
