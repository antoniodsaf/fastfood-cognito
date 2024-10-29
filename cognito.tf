resource "aws_cognito_user_pool" "cognito_user_pool" {
  name = "fastfood-user-pool"
  
  password_policy {
    minimum_length    = 6
    require_lowercase = false
    require_numbers   = false
    require_symbols   = false
    require_uppercase = false
  }
  mfa_configuration = "OFF"
}

resource "aws_cognito_user_pool_client" "fastfood_app_client" {
  name                                 = "fastfood_app_client"
  user_pool_id                         = aws_cognito_user_pool.cognito_user_pool.id
  allowed_oauth_flows                  = ["code", "implicit"]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_scopes                 = ["openid", "profile"]
  callback_urls                        = ["https://example.com/callback"]
  logout_urls                          = ["https://example.com/logout"]
  supported_identity_providers         = ["COGNITO"]
  explicit_auth_flows                  = [
    "ALLOW_ADMIN_USER_PASSWORD_AUTH", "ALLOW_CUSTOM_AUTH", "ALLOW_REFRESH_TOKEN_AUTH", "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_USER_SRP_AUTH"
  ]
}