# Create a Public/Private SSL Certificate using AWS ACM

This terraform module will create the following services:
- SSL Certificate
- Route53 Record

## Licence:
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

MIT Licence. See [Licence](LICENCE) for full details.

# Usage Instructions:
## Example:
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

## Variables
| Parameter             | Type    | Description                                                                                                                                                          | Default       | Required |
|-----------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------|----------|
| domain_names                | list  | List of domain names to be associated with SSL certificate                                                                                                                                  |              | Y        |
| hosted_zone            | string    | Name of hosted zone to create DNS records                                                                                                              |              | Y        |
| pca_arn            | string    | ARN of private certificate authority to sign and generate private certificate                                                                                   |              | N        |

## Outputs
| Parameter           | Type   | Description               |
|---------------------|--------|---------------------------|
| arn           | string | ARN of SSL certificate            |

## Deployment
- `terraform init` - download plugins required to deploy resources
- `terraform plan` - get detailed view of resources that will be created, deleted or replaced
- `terraform apply -auto-approve` - deploy the template without confirmation (non-interactive mode)
- `terraform destroy -auto-approve` - terminate all the resources created using this template without confirmation (non-interactive mode)
