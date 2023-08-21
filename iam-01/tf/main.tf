terraform {
  required_providers {
    iamtf = {
      //version = "~> 0.3.3"
      version = "0.8.1"
      source  = "atricore/iamtf"
    }
  }
}

provider "iamtf" {
  org_name      = "atricore"
  endpoint      = "http://localhost:8081/atricore-rest/services"
  client_id     = "idbus-f2f7244e-bbce-44ca-8b33-f5c0bde339f7"
  client_secret = "7oUHlv(HLT%vxK4L"
}

resource "iamtf_identity_appliance" "iam-demo" {
  name        = "iam-demo"
  namespace   = "com.atricore.iam.demo"
  description = "Appliance #1"
  location    = "http://localhost:8081"
}
