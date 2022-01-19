variable "token" {}
variable "authorized_keys" {}
variable "root_pass" {}
variable "type" {
  description = "The type of instance to deploy"
  default = "g6-standard-2"
}
variable "region" {
  default = "us-east"
}
