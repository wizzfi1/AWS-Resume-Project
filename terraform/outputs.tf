output "site_url" {
  value = "https://${aws_cloudfront_distribution.cdn.domain_name}"
}

output "api_gateway_url" {
  value = aws_apigatewayv2_api.api.api_endpoint
}
