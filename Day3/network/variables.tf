variable "vpc_cidr" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}

variable "subnets" {
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