resource "aws_ses_email_identity" "sender" {
  email = "mohamed.gshibl@gmail.com"
}

resource "aws_ses_email_identity" "receiver" {
  email = "mohamad.gamal3456@gmail.com"
}