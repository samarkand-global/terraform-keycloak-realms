variable "realms" {
  description = "A map of objects where each key is the name of the Realm to be managed, and each value is an object representing that Realm's configuration."
  type = map(object({
    enabled             = optional(bool)
    display_name        = optional(string)
    display_name_html   = optional(string)
    user_managed_access = optional(bool)
    attributes          = optional(map(string))

    # Login
    registration_allowed           = optional(bool)
    registration_email_as_username = optional(bool)
    edit_username_allowed          = optional(bool)
    reset_password_allowed         = optional(bool)
    remember_me                    = optional(bool)
    verify_email                   = optional(bool)
    login_with_email_allowed       = optional(bool)
    duplicate_emails_allowed       = optional(bool)
    ssl_required                   = optional(string)

    # Themes
    account_theme = optional(string)
    admin_theme   = optional(string)
    email_theme   = optional(string)
    login_theme   = optional(string)

    # Tokens
    default_signature_algorithm = optional(string)
    revoke_refresh_token        = optional(bool)
    refresh_token_max_reuse     = optional(number)

    # Sessions
    sso_session_idle_timeout                 = optional(string)
    sso_session_max_lifespan                 = optional(string)
    offline_session_idle_timeout             = optional(string)
    offline_session_max_lifespan             = optional(string)
    offline_session_max_lifespan_enabled     = optional(bool)
    client_session_idle_timeout              = optional(string)
    client_session_max_lifespan              = optional(string)
    access_token_lifespan                    = optional(string)
    access_token_lifespan_for_implicit_flow  = optional(string)
    access_code_lifespan                     = optional(string)
    access_code_lifespan_login               = optional(string)
    access_code_lifespan_user_action         = optional(string)
    action_token_generated_by_user_lifespan  = optional(string)
    action_token_generated_by_admin_lifespan = optional(string)
    oauth2_device_code_lifespan              = optional(string)
    oauth2_device_polling_interval           = optional(number)

    # SMTP
    smtp_server = optional(object({
      host                  = string
      port                  = optional(number)
      from                  = string
      from_display_name     = optional(string)
      reply_to              = optional(string)
      reply_to_display_name = optional(string)
      envelope_from         = optional(string)
      starttls              = optional(bool)
      ssl                   = optional(bool)
      auth = optional(object({
        username = string
        password = string
      }))
    }))

    # Internationalization
    internationalization = optional(object({
      supported_locales = list(string)
      default_locale    = string
    }))

    # Security Defenses
    security_defenses = optional(object({
      headers = optional(object({
        x_frame_options                     = optional(string)
        content_security_policy             = optional(string)
        content_security_policy_report_only = optional(string)
        x_content_type_options              = optional(string)
        x_robots_tag                        = optional(string)
        x_xss_protection                    = optional(string)
        string_transport_security           = optional(string)
      }))
      brute_force_detection = optional(object({
        permanent_lockout                = optional(bool)
        max_login_features               = optional(number)
        wait_increment_seconds           = optional(number)
        quick_login_check_milli_seconds  = optional(number)
        minimum_quick_login_wait_seconds = optional(number)
        max_failure_wait_seconds         = optional(number)
        failure_reset_time_seconds       = optional(number)
      }))
    }))

    # Authentication
    password_policy            = optional(string)
    browser_flow               = optional(string)
    registration_flow          = optional(string)
    direct_grant_flow          = optional(string)
    reset_credentials_flow     = optional(string)
    client_authentication_flow = optional(string)
    docker_authentication_flow = optional(string)

    # OTP Policy
    otp_policy = optional(object({
      type              = optional(string)
      algorithm         = optional(string)
      digits            = optional(number)
      initial_counter   = optional(number)
      look_ahead_window = optional(number)
      period            = optional(number)
    }))

    # WebAuthn
    web_authn_policy = optional(object({
      relying_party_entity_name         = optional(string)
      relying_party_id                  = optional(string)
      signature_algorithms              = optional(set(string))
      attestation_conveyance_preference = optional(string)
      authentication_attachment         = optional(string)
      require_resident_key              = optional(string)
      user_verification_requirement     = optional(string)
      create_timeout                    = optional(number)
      avoid_same_authenticator_register = optional(bool)
      acceptable_aaguids                = optional(set(string))
    }))
    web_authn_passwordless_policy = optional(object({
      relying_party_entity_name         = optional(string)
      relying_party_id                  = optional(string)
      signature_algorithms              = optional(set(string))
      attestation_conveyance_preference = optional(string)
      authentication_attachment         = optional(string)
      require_resident_key              = optional(string)
      user_verification_requirement     = optional(string)
      create_timeout                    = optional(number)
      avoid_same_authenticator_register = optional(bool)
      acceptable_aaguids                = optional(set(string))
    }))

    default_default_client_scopes  = optional(list(string))
    default_optional_client_scopes = optional(list(string))
  }))

  default = {}
}
