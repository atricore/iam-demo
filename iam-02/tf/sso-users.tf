
resource "iamtf_idsource_ldap" "sso-users" {
    ida             = iamtf_identity_appliance.devsso-01.name
    name            = "sso-users"
    provider_url    = "ldap://ldap:389"
    username        = "cn=admin,dc=evolveum,dc=com"
    password        = "secret"

    // Groups
    groups_ctx_dn   = "ou=groups,dc=evolveum,dc=com"
    groupid_attr    = "cn"
    groupmember_attr = "member"
    
    // Users
    users_ctx_dn    = "ou=people,dc=evolveum,dc=com"
    userid_attr     = "uid"
    
    // User attributes
    user_attributes {
        attribute = "cn"
        claim = "first_name"
    }

    user_attributes {
        attribute = "sn"
        claim = "last_name"
    }

        // User attributes
    user_attributes {
        attribute = "mail"
        claim = "email"
    }
    
}