variable "vpc_cidr" {
  type    = string
  default = ""
}
variable "region" {
  type    = string
  default = ""
}
variable "ami_id" {
  type    = string
  default = ""
}
variable "ec2_type" {
  type    = string
  default = ""
}
variable "env" {
  type    = string
  default = ""
}

variable "subnet-list" {
  type = list(object({
    name = string
    cidr = string
    az   = string
    type = string
  }))
  default = [
    {
      name = ""
      cidr = ""
      az   = ""
      type = ""
    }
  ]
}