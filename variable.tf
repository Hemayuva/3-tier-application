# Defining CIDR block for VPC
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

#defining CIDR block for 1st subnet
variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

#defining CIDR block for 2nd subnet
variable "subnet1_cidr" {
  default = "10.0.2.0/24"
}

#defining CIDR block for 3rd subnet
variable "subnet2_cidr" {
  default = "10.0.3.0/24"
}

#defining CIDR block for 4th subnet
variable "subnet3_cidr" {
  default = "10.0.4.0/24"
}

#defining CIDR block for 5th subnet
variable "subnet4_cidr" {
  default = "10.0.5.0/24"
}
#defining CIDR block for 6th subnet
variable "subnet5_cidr" {
  default = "10.0.6.0/24"
}
    
