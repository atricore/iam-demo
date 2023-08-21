// Tomcat application
resource "iamtf_app_agent" "partnerapp1" {
  ida          = iamtf_identity_appliance.iam-demo.name
  name         = "partnerapp1"

  // Application base location
  app_location = "http://localhost:8180/partnerapp1"

  // Trusted identity providers
  idp {
    name         = iamtf_idp.idp-1.name
    is_preferred = true
  }
  
  // Tomcat server
  exec_env = iamtf_execenv_tomcat.tc.name

  keystore {
    resource     = filebase64("./saml.p12")
    password     = "changeme"
    key_password = "secret"
  }
}