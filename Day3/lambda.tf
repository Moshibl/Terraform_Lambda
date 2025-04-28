resource "aws_lambda_function" "Mail-Lambda" {
  filename      = "lambda.zip"
  function_name = "Mail-Lambda"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "code.lambda_handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.13"
  environment {
    variables = {
      SENDER_EMAIL = aws_ses_email_identity.sender.email
      RECIPIENT_EMAIL = aws_ses_email_identity.receiver.email
    }
  }
}


resource "aws_s3_bucket_notification" "Lambda_Trigger" {
  bucket = var.bucket_name

  lambda_function {
    lambda_function_arn = aws_lambda_function.Mail-Lambda.arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".tfstate"
  }
  depends_on = [aws_lambda_permission.allow_s3]
}