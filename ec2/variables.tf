variable "redhat" {
  description = "set system operation redhat if is true"
  default = true
  type = bool
}
variable "ubuntu" {
  description = "set system operation ubuntu if is true"
  default = false
}
variable "instance_type" {
  description = "type of the instance"
  type = string
  
}
variable "instance_name" {
  description = "type of the instance"
  type = string
  
}
variable "key_name" {
  description = "name of the key"
  type = string
  
}
variable "environment" {
  description = "name of the Environment"
  type = string
  
}
variable "iam_instance_profile" {
  description = "name of the instance"
  type = string
  
}
