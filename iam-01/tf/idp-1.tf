resource "iamtf_idp" "idp-1" {
  ida  = iamtf_identity_appliance.iam-demo.name
  name = "idp-1"

  keystore {
    resource = filebase64("./saml.p12")
    password = "changeme"
  }

  authn_bind_ldap {
    priority          = 0
    provider_url      = "ldap://openldap:1389"
    username          = "cn=admin,dc=demo,dc=atricore,dc=com"
    password          = "secret"
    authentication    = "simple"
    password_policy   = "none"
    perform_dn_search = false

    // Users
    users_ctx_dn      = "ou=users,dc=demo,dc=atricore,dc=com"
    userid_attr       = "uid"

    saml_authn_ctx    = "urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport"
    referrals         = "follow"
    operational_attrs = true

  }

  id_sources = [iamtf_idsource_ldap.ad-users.name]

}