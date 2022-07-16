variable "description" {
  type = string
  default = "Teste"
}
variable "function_name" {
  type = string
  default = "Teste"
}
variable "lambda_handler" {
  type = string
  default = "Teste"
}
variable "runtime" {
  type = string
  default = "nodejs14.x"
}
variable "lambda_envs" {
    type = map(string)
    default = {
    }
