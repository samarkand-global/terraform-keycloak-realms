## Keycloak Realms
This Terraform module manages one or more Keycloak realms using the mrparkers/keycloak provider, specified as a map of objects where keys are realm names, values are objects representing the realm.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_keycloak"></a> [keycloak](#requirement\_keycloak) | ~> 3.10 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_keycloak"></a> [keycloak](#provider\_keycloak) | ~> 3.10 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [keycloak_realm.this](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/realm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_realms"></a> [realms](#input\_realms) | A map of objects where each key is the name of the Realm to be managed, and each value is an object representing that Realm's configuration. | <pre>map(object({<br>    enabled             = optional(bool)<br>    display_name        = optional(string)<br>    display_name_html   = optional(string)<br>    user_managed_access = optional(bool)<br>    attributes          = optional(map(string))<br><br>    # Login<br>    registration_allowed           = optional(bool)<br>    registration_email_as_username = optional(bool)<br>    edit_username_allowed          = optional(bool)<br>    reset_password_allowed         = optional(bool)<br>    remember_me                    = optional(bool)<br>    verify_email                   = optional(bool)<br>    login_with_email_allowed       = optional(bool)<br>    duplicate_emails_allowed       = optional(bool)<br>    ssl_required                   = optional(string)<br><br>    # Themes<br>    account_theme = optional(string)<br>    admin_theme   = optional(string)<br>    email_theme   = optional(string)<br>    login_theme   = optional(string)<br><br>    # Tokens<br>    default_signature_algorithm = optional(string)<br>    revoke_refresh_token        = optional(bool)<br>    refresh_token_max_reuse     = optional(number)<br><br>    # Sessions<br>    sso_session_idle_timeout                 = optional(string)<br>    sso_session_max_lifespan                 = optional(string)<br>    offline_session_idle_timeout             = optional(string)<br>    offline_session_max_lifespan             = optional(string)<br>    offline_session_max_lifespan_enabled     = optional(bool)<br>    client_session_idle_timeout              = optional(string)<br>    client_session_max_lifespan              = optional(string)<br>    access_token_lifespan                    = optional(string)<br>    access_token_lifespan_for_implicit_flow  = optional(string)<br>    access_code_lifespan                     = optional(string)<br>    access_code_lifespan_login               = optional(string)<br>    access_code_lifespan_user_action         = optional(string)<br>    action_token_generated_by_user_lifespan  = optional(string)<br>    action_token_generated_by_admin_lifespan = optional(string)<br>    oauth2_device_code_lifespan              = optional(string)<br>    oauth2_device_polling_interval           = optional(number)<br><br>    # SMTP<br>    smtp_server = optional(object({<br>      host                  = string<br>      port                  = optional(number)<br>      from                  = string<br>      from_display_name     = optional(string)<br>      reply_to              = optional(string)<br>      reply_to_display_name = optional(string)<br>      envelope_from         = optional(string)<br>      starttls              = optional(bool)<br>      ssl                   = optional(bool)<br>      auth = optional(object({<br>        username = string<br>        password = string<br>      }))<br>    }))<br><br>    # Internationalization<br>    internationalization = optional(object({<br>      supported_locales = list(string)<br>      default_locale    = string<br>    }))<br><br>    # Security Defenses<br>    security_defenses = optional(object({<br>      headers = optional(object({<br>        x_frame_options                     = optional(string)<br>        content_security_policy             = optional(string)<br>        content_security_policy_report_only = optional(string)<br>        x_content_type_options              = optional(string)<br>        x_robots_tag                        = optional(string)<br>        x_xss_protection                    = optional(string)<br>        string_transport_security           = optional(string)<br>      }))<br>      brute_force_detection = optional(object({<br>        permanent_lockout                = optional(bool)<br>        max_login_features               = optional(number)<br>        wait_increment_seconds           = optional(number)<br>        quick_login_check_milli_seconds  = optional(number)<br>        minimum_quick_login_wait_seconds = optional(number)<br>        max_failure_wait_seconds         = optional(number)<br>        failure_reset_time_seconds       = optional(number)<br>      }))<br>    }))<br><br>    # Authentication<br>    password_policy            = optional(string)<br>    browser_flow               = optional(string)<br>    registration_flow          = optional(string)<br>    direct_grant_flow          = optional(string)<br>    reset_credentials_flow     = optional(string)<br>    client_authentication_flow = optional(string)<br>    docker_authentication_flow = optional(string)<br><br>    # OTP Policy<br>    otp_policy = optional(object({<br>      type              = optional(string)<br>      algorithm         = optional(string)<br>      digits            = optional(number)<br>      initial_counter   = optional(number)<br>      look_ahead_window = optional(number)<br>      period            = optional(number)<br>    }))<br><br>    # WebAuthn<br>    web_authn_policy = optional(object({<br>      relying_party_entity_name         = optional(string)<br>      relying_party_id                  = optional(string)<br>      signature_algorithms              = optional(set(string))<br>      attestation_conveyance_preference = optional(string)<br>      authentication_attachment         = optional(string)<br>      require_resident_key              = optional(string)<br>      user_verification_requirement     = optional(string)<br>      create_timeout                    = optional(number)<br>      avoid_same_authenticator_register = optional(bool)<br>      acceptable_aaguids                = optional(set(string))<br>    }))<br>    web_authn_passwordless_policy = optional(object({<br>      relying_party_entity_name         = optional(string)<br>      relying_party_id                  = optional(string)<br>      signature_algorithms              = optional(set(string))<br>      attestation_conveyance_preference = optional(string)<br>      authentication_attachment         = optional(string)<br>      require_resident_key              = optional(string)<br>      user_verification_requirement     = optional(string)<br>      create_timeout                    = optional(number)<br>      avoid_same_authenticator_register = optional(bool)<br>      acceptable_aaguids                = optional(set(string))<br>    }))<br><br>    default_default_client_scopes  = optional(list(string))<br>    default_optional_client_scopes = optional(list(string))<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_internal_ids"></a> [internal\_ids](#output\_internal\_ids) | Map of Realm names and internal IDs. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
