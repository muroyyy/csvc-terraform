resource "aws_secretsmanager_secret" "db_credentials" {
  name = "csvc-mysql-credentials"
}

resource "aws_secretsmanager_secret_version" "db_credentials_value" {
  secret_id     = aws_secretsmanager_secret.db_credentials.id
  secret_string = jsonencode({
    db_username = var.db_username,
    db_password = var.db_password,
    db_name     = var.db_name,
    db_endpoint = var.db_endpoint
  })
}
