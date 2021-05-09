variable "domain_names" {
  type        = list(string)
  description = "List of domain names to be associated with SSL certificate"
}

variable "hosted_zone" {
  type        = string
  description = "Name of hosted zone to create DNS records"
}

variable "pca_arn" {
  type        = string
  default     = null
  description = "ARN of private certificate authority to sign and generate private certificate"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Map of key value pair to assign to certificate"
}
