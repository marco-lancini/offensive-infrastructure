# Copyright 2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file
# except in compliance with the License. A copy of the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is distributed on an "AS IS"
# BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under the License.
resource "aws_vpc" "lab" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "terraform_vpc"
    }
}
output "vpc_id" {
    value = "${aws_vpc.lab.id}"
}

resource "aws_internet_gateway" "terraform_igw" {
    vpc_id = "${aws_vpc.lab.id}"
    tags {
        Name = "terraform_igw"
    }
}


#
# NAT Instance
#
resource "aws_instance" "terraform_nat_instance" {
    ami = "ami-75ae8245" # this is a special ami preconfigured to do NAT
    availability_zone = "${element(var.availability_zones, 0)}"
    instance_type = "t2.small"
    key_name = "${var.key_name}"
    security_groups = ["${aws_security_group.nat.id}"]
    subnet_id = "${aws_subnet.terraform_public_subnet.id}"
    associate_public_ip_address = true
    source_dest_check = false
    tags {
        Name = "terraform_nat_instance"
    }
}

resource "aws_eip" "nat_eip" {
    instance = "${aws_instance.terraform_nat_instance.id}"
    vpc = true
}


#
# Public Subnet
#
resource "aws_subnet" "terraform_public_subnet" {
    vpc_id = "${aws_vpc.lab.id}"
    cidr_block = "${var.public_subnet_cidr}"
    availability_zone = "${element(var.availability_zones,0)}"
    tags {
        Name = "terraform_public_subnet"
    }
}
output "public_subnet_id" {
    value = "${aws_subnet.terraform_public_subnet.id}"
}

resource "aws_route_table" "terraform_public_subnet_route_table" {
    vpc_id = "${aws_vpc.lab.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.terraform_igw.id}"
    }
    tags {
        Name = "terraform_public_subnet_route_table"
    }
}

resource "aws_route_table_association" "terraform_public_subnet_route_association" {
    subnet_id = "${aws_subnet.terraform_public_subnet.id}"
    route_table_id = "${aws_route_table.terraform_public_subnet_route_table.id}"
}


#
# Private Subnet
#
resource "aws_subnet" "terraform_private_subnet" {
    vpc_id = "${aws_vpc.lab.id}"
    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = "${element(var.availability_zones, 0)}"
    tags {
        Name = "terraform_private_subnet"
    }
}
output "private_subnet_id" {
    value = "${aws_subnet.terraform_private_subnet.id}"
}

resource "aws_route_table" "terraform_private_subnet_route_table" {
    vpc_id = "${aws_vpc.lab.id}"
    route {
        cidr_block = "0.0.0.0/0"
        instance_id = "${aws_instance.terraform_nat_instance.id}"
    }
    tags {
        Name = "terraform_private_subnet_route_table"
    }
}

resource "aws_route_table_association" "terraform_private_subnet_route_association" {
    subnet_id = "${aws_subnet.terraform_private_subnet.id}"
    route_table_id = "${aws_route_table.terraform_private_subnet_route_table.id}"
}
