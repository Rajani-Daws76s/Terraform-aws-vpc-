data "aws_availability_zones" "azs" {
    #name = "us-east-1" # here your need to mention region name but in provider.tf you have region info so, skipping it.
    #all_availability_zones = true 
    state = "available"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_route_table" "default" {
    vpc_id = data.aws_vpc.default.id
    filter {
        name = "association.main"
        values = ["true"]
    }
}