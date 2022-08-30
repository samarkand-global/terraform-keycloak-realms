output "realm_internal_ids" {
  description = "Map of Realm names and internal IDs."
  value = {
    for realm in keys(var.realms) :
    realm => keycloak_realm.this[realm].internal_id
  }
}
