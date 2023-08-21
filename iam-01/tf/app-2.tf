// Tomcat application
resource "iamtf_app_agent" "partnerapp2" {
  ida  = iamtf_identity_appliance.iam-demo.name
  name = "partnerapp2"

  // Application base location
  app_location = "http://localhost:8080/partnerapp2"

  // Trusted identity providers
  idp {
    name         = iamtf_idp.idp-1.name
    is_preferred = true
  }

  // Tomcat server
  exec_env = iamtf_execenv_iis.iis.name

  keystore {
    resource     = filebase64("./saml.p12")
    password     = "changeme"
    key_password = "secret"
  }

}