// IIS server definicion
resource "iamtf_execenv_iis" "iis" {
  ida                  = iamtf_identity_appliance.iam-demo.name
  name                 = "iis"
  description          = "IIS "
  architecture         = "64"
  isapi_extension_path = "/josso.sso"
  depends_on           = [iamtf_idp.idp-1]
}


