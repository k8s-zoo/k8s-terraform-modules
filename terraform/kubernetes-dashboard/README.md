# Module: kubernetes-dashboard

## Introduction

Terraform modules deploys the Kubernetes Dashboard.


### Development

**Example**

```hcl-terraform

data "aws_eks_cluster" "cluster" {
  name = var.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = var.cluster_id
}

# Connecting to AWS EKS
   
provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
}

module "kubernetes_dashboard" {
  source = "git@github.com/k8s-zoo/k8s-terraform-modules.git//terraform/kubernetes-dashboard"
}
```
 
**Variables**: For more info on variables, check [file](variables.tf)
    
## Overview

- **Maintainer**: mishalshah92@gmail.com