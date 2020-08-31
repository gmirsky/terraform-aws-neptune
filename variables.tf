variable "instance" {
  description = "Instance variable mapping"
  type        = map
  default = {
    count                      = 2
    engine                     = "neptune"
    instance_class             = "db.t3.medium"
    apply_immediately          = true
    auto_minor_version_upgrade = true
  }
}

variable "vpc_name_tag" {
  description = "VPC Name Tag"
  type        = string
  default     = "Main VPC"
}

variable "subnet_private_tag" {
  description = "Subnet Private Tag"
  type        = string
  default     = "Private-Subnet"
}

variable region {
  type        = string
  default     = "us-east-1"
  description = "AWS Region to deploy into"
}
