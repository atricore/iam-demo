// IIS server definicion
resource "iamtf_execenv_iss" "iss" {
  ida                  = iamtf_identity_appliance.devsso-01.name
  name                 = "iss"
  description          = "IIS "
  architecture         = "64"
  isapi_extension_path = "/josso.sso"
  depends_on           = [iamtf_idp.idp-1]
}


