# Instructions

## 1. Build docker images



```
docker compose build
```

## 2. Run docker images

```
docker compose up
```

## 3. Configure Midpoint

* Acceass console

http://localhost:8080/midpoint

user: admnistrator
password: 5ecr3t

* Import connector: 102-resource-openldap.xml

## 4. Manage users

* Add users and add Assigment -> LDAP

* Set user password

* Modify users


## 5. Configure JOSSO

* Apply TF configuration

* Start identity appliance

# 6. Test

http://localhost:8180/partnerapp1

user/password as created in midpoint







