variable subnet_cidr_block {
    default = "10.0.1.0/24"
    description = "My Test Subnet"
}

variable subnet_dns_label {
    default = "test"
}

resource "oci_core_subnet" "test_subnet" {
    #Required
    cidr_block = var.subnet_cidr_block
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.test_vcn.id
    route_table_id = oci_core_vcn.test_vcn.default_route_table_id
    security_list_ids = [oci_core_vcn.test_vcn.default_security_list_id]
    dhcp_options_id = oci_core_vcn.test_vcn.default_dhcp_options_id
    display_name = var.subnet_dns_label
    dns_label = var.subnet_dns_label
}