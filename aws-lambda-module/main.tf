data "archive_file" "lambda_zip" {
  
    type        = "zip"
    source_dir  = "${path.module}/code"
    output_path = "${path.module}/code.zip"
}

resource "aws_lambda_function" "gerenic_lambda" {
  filename         = "${path.module}/code.zip"
  description      =  var.description
  function_name    =  var.function_name
  role             = "${aws_iam_role.iam_for_lambda_tf.arn}"
  handler          =  var.handler
  source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
  runtime          =  var.runtime
  tags = var.tags

environment {
  
    variables = "${var.lambda_envs}"
  }
}

resource "aws_iam_role_policy_attachment" "lambda-ec2" {
  count = var.attach_policy_ec2 ? 1 : 0
  role       = aws_iam_role.iam_for_lambda_tf.name
  policy_arn = aws_iam_policy.lambda-ec2.arn

}