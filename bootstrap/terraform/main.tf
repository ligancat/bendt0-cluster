
############## Helpful Hints ###################

# Any configuration updates should be done in this file in a manual section. You can also create files alongside this one, 
# and plural build will preserve them.  That's the ideal strategy if you want to add additional resources like a sql instance
# or vpn gateway.

# The submodule folders within this directory are generated by plural build and we cannot guarantee a change in 
# them will be merged properly.

#################################################

terraform {
  backend "s3" {
    bucket = "bendt-tf-state"
    key = "icedard/bootstrap/terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.63.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_eks_cluster" "cluster" {
  name = module.aws-bootstrap.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.aws-bootstrap.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

module "aws-bootstrap" {
  source = "./aws-bootstrap"

### BEGIN MANUAL SECTION <<aws-bootstrap>>

### END MANUAL SECTION <<aws-bootstrap>>


  vpc_name = "plural"
  cluster_name = "icedard"
  
  map_roles = [
    {
      rolearn = "arn:aws:iam::038462791204:role/icedard-console"
      username = "console"
      groups = ["system:masters"]
    }
  ]
  
  aws_region = "us-east-1"
  

}
