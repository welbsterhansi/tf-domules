module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"
  function_name = var.function_name
  description   = var.description
  handler       = var.lambda_handler
  runtime       = var.runtime
  create_package         = false
  local_existing_package = "./code.zip"

  environment {
  
    variables = "${var.lambda_envs}"
  }

  }
 