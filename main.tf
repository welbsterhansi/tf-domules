provider "aws" {

  region = "us-east-1"

}

module "lambda" {
  source = "./lambda-module"
  handler = "src::aws:handlrExample::aws/src/index.handler"
  runtime = "dotnet6"
  function_name = "function_framework_send_reports"
  description = "lambda dotnet6 app invition"
  role_name = "function_framework_send_reports"
  policy_name = "function_framework_send_reports"
  attach_policy_ec2 = false
  lambda_envs = {
    "data" = "user1"
  }
  
}

# OutPuts

output "lambda_arn" {
  value = module.lambda.lambda_arn
  }
output "hash_package_base64" {
  value = module.lambda.hash_package  
}

output "role_arn" {
  value = module.lambda.role_arn
