output "lambda_arn" {
    description = "lambda_arn"
    value = aws_iam_role.iam_for_lambda_tf.arn
}
output "hash_package" {
    value = data.archive_file.lambda_zip.output_base64sha256
}   
output "role_name" {
    value = aws_iam_role.iam_for_lambda_tf.name
  
}
output "role_arn" {
    value = aws_iam_role.iam_for_lambda_tf.arn
  
}