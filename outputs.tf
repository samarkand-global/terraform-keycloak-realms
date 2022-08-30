output "realm_internal_ids" {
  value = {
    for realm in keys(var.realms) :
    realm => keycloak_realm.this[realm].internal_id
  }
}
