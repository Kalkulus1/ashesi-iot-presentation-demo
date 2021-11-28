output "certificate" {
  value = [
    {
      id : aws_iot_certificate.cert.id
      arn : aws_iot_certificate.cert.arn
      certificate_pem : aws_iot_certificate.cert.certificate_pem
      public_key : aws_iot_certificate.cert.public_key
      private_key : aws_iot_certificate.cert.private_key
    }
  ]
  sensitive = true
}