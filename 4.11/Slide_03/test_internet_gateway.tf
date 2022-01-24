resource "oci_core_internet_gateway" "test_internet_gateway" {
  #Required
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.test_vcn.id

  #Optional
  display_name = var.internet_gateway_display_name
  enabled      = var.internet_gateway_enabled

  freeform_tags = {
    "Department"    = "Hosting"
    "Customer"      = "ACME GmbH"
    "SPOC"          = "Max Mustermann"
    "CostCenter"    = "08154711"
    "BillingPeriod" = "monthly"
    "Terraform"     = true
  }
}