output "arn" {
  value       = aws_acm_certificate.cert.arn
  description = "ARN of SSL certificate"
}
