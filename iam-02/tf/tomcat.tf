// Tomcat server definicion
resource "iamtf_execenv_tomcat" "tc" {
  ida         = iamtf_identity_appliance.devsso-01.name
  name        = "tc"
  description = "Tomcat 8"
  version     = "8.5"
  
  depends_on = [iamtf_idp.idp-1]
}