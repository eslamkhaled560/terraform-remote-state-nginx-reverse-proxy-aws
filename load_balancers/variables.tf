variable "vpc_id" {
  type = string
  default = ""
}

variable "subnets_pub" {
  type = list(string)
  default = ["", ""]
}

variable "subnets_pvt" {
  type = list(string)
  default = ["", ""]
}

variable "nginx1_id" {
  type = string
  default = ""
}

variable "nginx2_id" {
  type = string
  default = ""
}

variable "apache1_id" {
  type = string
  default = ""
}

variable "apache2_id" {
  type = string
  default = ""
}