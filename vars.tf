variable "domain_names" {
  type = list(any)
}

variable "hosted_zone" {}

variable "pca_arn" {
  default = null
}

variable "tags" {
  type    = map(any)
  default = {}
}
