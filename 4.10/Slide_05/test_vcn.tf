resource "oci_core_vcn" "test_vcn" {
  #Required
  compartment_id = var.compartment_id
  #cidr_blocks = var.vcn_cidr_blocks
  cidr_blocks = var.vcn_cidr_blocks
  dns_label   = var.vcn_dns_label
}
