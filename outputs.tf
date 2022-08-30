output "internal_ids" {
  description = "Map of Realm names and internal IDs."
  value = {
    for name, config in keycloak_realm.this :
    name => config.internal_id
  }
}
