variable subnet_cidr_block {
    default = "10.1.1.0/24"
    description = "My Test Subnet"
}

resource "oci_core_subnet" "test_subnet" {
    #Required
    cidr_block = var.subnet_cidr_block
    #compartment_id = var.compartment_id
    compartment_id = var.tenancy_ocid
    vcn_id = oci_core_vcn.test_vcn.id
}