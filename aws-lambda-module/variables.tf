variable "description" {
  description = "Description of your Lambda Function (or Layer)"
  type        = string
}
variable "function_name" {
  description = "A unique name for your Lambda Function"
  type        = string
}

variable "handler" {
  description = "Lambda Function entrypoint in your code"
  type        = string
}
variable "runtime" {
  description = "Lambda Function runtime"
  type        = string
  #  validation {
  #    condition     = can(var.create && contains(["nodejs10.x", "nodejs12.x", "java8", "java11", "python2.7", " python3.6", "python3.7", "python3.8", "dotnetcore2.1", "dotnetcore3.1", "go1.x", "ruby2.5", "ruby2.7", "provided"], var.runtime))
  #    error_message = "The runtime value must be one of supported by AWS Lambda."
  #  }
}
variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}

variable "lambda_envs" {
    type = map(string)
    default = {
    }
}
variable "role_name" {
  description = "Lambda Function entrypoint in your code"
  type        = string
}
variable "production" {
  default = true
  
}
variable "attach_policy_ec2" {
  default = false
  type = bool
  
}
variable "policy_name" {
  description = "Lambda Function entrypoint in your code"
  type        = string
}