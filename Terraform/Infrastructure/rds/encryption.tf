resource "aws_kms_key" "portifoliodbkey" {
  description             = "KMS for encrypted db"
  deletion_window_in_days = 10
  is_enabled = true
  #enable_key_rotation = true //TODOs Check pricing
}