# Create a Public/Private SSL Certificate using AWS ACM
fff
![License](https://img.shields.io/github/license/terrablocks/aws-acm-ssl-certificate?style=for-the-badge) ![Tests](https://img.shields.io/github/actions/workflow/status/terrablocks/aws-acm-ssl-certificate/tests.yml?branch=main&label=Test&style=for-the-badge) ![Checkov](https://img.shields.io/github/actions/workflow/status/terrablocks/aws-acm-ssl-certificate/checkov.yml?branch=main&label=Checkov&style=for-the-badge) ![Commit](https://img.shields.io/github/last-commit/terrablocks/aws-acm-ssl-certificate?style=for-the-badge) ![Release](https://img.shields.io/github/v/release/terrablocks/aws-acm-ssl-certificate?style=for-the-badge)

This terraform module will deploy the following services:
- SSL Certificate
- Route53 Record

# Usage Instructions
## Example
### Public SSL
```terraform
module "ssl" {
  source = "github.com/terrablocks/aws-acm-ssl-certificate.git"

  domain_names = ["example.com", "*.example.com"]
  hosted_zone  = "example.com"
}
```
### Private SSL
```terraform
module "ssl" {
  source = "github.com/terrablocks/aws-acm-ssl-certificate.git"

  domain_names = ["example.com", "*.example.com"]
  hosted_zone  = "example.com"
  pca_arn      = "arn:aws:acm-pca:region-code:000000000000:certificate-authority/xxxxxxx"
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.37.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| domain_names | List of domain names to be associated with SSL certificate | `list(string)` | n/a | yes |
| hosted_zone | Name of hosted zone to create DNS records | `string` | n/a | yes |
| pca_arn | ARN of private certificate authority to sign and generate private certificate | `string` | `null` | no |
| tags | Map of key value pair to assign to certificate | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | ARN of SSL certificate |
