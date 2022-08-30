resource "keycloak_realm" "this" {
  for_each = var.realms

  realm               = each.key
  enabled             = each.value.enabled
  display_name        = each.value.display_name
  display_name_html   = each.value.display_name_html
  user_managed_access = each.value.user_managed_access
  attributes          = each.value.attributes

  registration_allowed           = each.value.registration_allowed
  registration_email_as_username = each.value.registration_email_as_username
  edit_username_allowed          = each.value.edit_username_allowed
  reset_password_allowed         = each.value.reset_password_allowed
  remember_me                    = each.value.remember_me
  verify_email                   = each.value.verify_email
  login_with_email_allowed       = each.value.login_with_email_allowed
  duplicate_emails_allowed       = each.value.duplicate_emails_allowed
  ssl_required                   = each.value.ssl_required

  account_theme = each.value.account_theme
  admin_theme   = each.value.admin_theme
  email_theme   = each.value.email_theme
  login_theme   = each.value.login_theme

  default_signature_algorithm = each.value.default_signature_algorithm
  revoke_refresh_token        = each.value.revoke_refresh_token
  refresh_token_max_reuse     = each.value.refresh_token_max_reuse

  sso_session_idle_timeout                 = each.value.sso_session_idle_timeout
  sso_session_max_lifespan                 = each.value.sso_session_max_lifespan
  offline_session_idle_timeout             = each.value.offline_session_idle_timeout
  offline_session_max_lifespan             = each.value.offline_session_max_lifespan
  offline_session_max_lifespan_enabled     = each.value.offline_session_max_lifespan_enabled
  client_session_idle_timeout              = each.value.client_session_idle_timeout
  client_session_max_lifespan              = each.value.client_session_max_lifespan
  access_token_lifespan                    = each.value.access_token_lifespan
  access_token_lifespan_for_implicit_flow  = each.value.access_token_lifespan_for_implicit_flow
  access_code_lifespan                     = each.value.access_code_lifespan
  access_code_lifespan_login               = each.value.access_code_lifespan_login
  access_code_lifespan_user_action         = each.value.access_code_lifespan_user_action
  action_token_generated_by_user_lifespan  = each.value.action_token_generated_by_user_lifespan
  action_token_generated_by_admin_lifespan = each.value.action_token_generated_by_admin_lifespan
  oauth2_device_code_lifespan              = each.value.oauth2_device_code_lifespan
  oauth2_device_polling_interval           = each.value.oauth2_device_polling_interval

  dynamic "smtp_server" {
    for_each = each.value.smtp_server != null ? [each.value.smtp_server] : []

    content {
      host                  = smtp_server.value.host
      port                  = smtp_server.value.port
      from                  = smtp_server.value.from
      from_display_name     = smtp_server.value.from_display_name
      reply_to              = smtp_server.value.reply_to
      reply_to_display_name = smtp_server.value.reply_to_display_name
      envelope_from         = smtp_server.value.envelope_from
      starttls              = smtp_server.value.starttls
      ssl                   = smtp_server.value.ssl

      dynamic "auth" {
        for_each = smtp_server.value.auth != null ? [smtp_server.value.auth] : []

        content {
          username = auth.value.username
          password = auth.value.password
        }
      }
    }
  }

  dynamic "internationalization" {
    for_each = each.value.internationalization != null ? [each.value.internationalization] : []

    content {
      supported_locales = internationalization.value.supported_locales
      default_locale    = internationalization.value.default_locale
    }
  }

  dynamic "security_defenses" {
    for_each = each.value.security_defenses != null ? [each.value.security_defenses] : []

    content {
      dynamic "headers" {
        for_each = security_defenses.value.headers != null ? [security_defenses.value.headers] : []

        content {
          x_frame_options                     = headers.value.x_frame_options
          content_security_policy             = headers.value.content_security_policy
          content_security_policy_report_only = headers.value.content_security_policy_report_only
          x_content_type_options              = headers.value.x_content_type_options
          x_robots_tag                        = headers.value.x_robots_tag
          x_xss_protection                    = headers.value.x_xss_protection
          strict_transport_security           = headers.value.strict_transport_security
        }
      }

      dynamic "brute_force_detection" {
        for_each = security_defenses.value.brute_force_detection != null ? [security_defenses.value.brute_force_detection] : []

        content {
          permanent_lockout                = brute_force_detection.value.permanent_lockout
          max_login_failures               = brute_force_detection.value.max_login_failures
          wait_increment_seconds           = brute_force_detection.value.wait_increment_seconds
          quick_login_check_milli_seconds  = brute_force_detection.value.quick_login_check_milli_seconds
          minimum_quick_login_wait_seconds = brute_force_detection.value.minimum_quick_login_wait_seconds
          max_failure_wait_seconds         = brute_force_detection.value.max_failure_wait_seconds
          failure_reset_time_seconds       = brute_force_detection.value.failure_reset_time_seconds
        }
      }
    }
  }

  password_policy            = each.value.password_policy
  browser_flow               = each.value.browser_flow
  registration_flow          = each.value.registration_flow
  direct_grant_flow          = each.value.direct_grant_flow
  reset_credentials_flow     = each.value.reset_credentials_flow
  client_authentication_flow = each.value.client_authentication_flow
  docker_authentication_flow = each.value.docker_authentication_flow

  dynamic "otp_policy" {
    for_each = each.value.otp_policy != null ? [each.value.otp_policy] : []

    content {
      type              = otp_policy.value.type
      algorithm         = otp_policy.value.algorithm
      digits            = otp_policy.value.digits
      initial_counter   = otp_policy.value.initial_counter
      look_ahead_window = otp_policy.value.look_ahead_window
      period            = otp_policy.value.period
    }
  }

  dynamic "web_authn_policy" {
    for_each = each.value.web_authn_policy != null ? [each.value.web_authn_policy] : []

    content {
      relying_party_entity_name         = web_authn_policy.relying_party_entity_name
      relying_party_id                  = web_authn_policy.relying_party_id
      signature_algorithms              = web_authn_policy.signature_algorithms
      attestation_conveyance_preference = web_authn_policy.attestation_conveyance_preference
      authenticator_attachment          = web_authn_policy.authenticator_attachment
      require_resident_key              = web_authn_policy.require_resident_key
      user_verification_requirement     = web_authn_policy.user_verification_requirement
      create_timeout                    = web_authn_policy.create_timeout
      avoid_same_authenticator_register = web_authn_policy.avoid_same_authenticator_register
      acceptable_aaguids                = web_authn_policy.acceptable_aaguids
    }
  }

  dynamic "web_authn_passwordless_policy" {
    for_each = each.value.web_authn_passwordless_policy != null ? [each.value.web_authn_passwordless_policy] : []

    content {
      relying_party_entity_name         = web_authn_passwordless_policy.relying_party_entity_name
      relying_party_id                  = web_authn_passwordless_policy.relying_party_id
      signature_algorithms              = web_authn_passwordless_policy.signature_algorithms
      attestation_conveyance_preference = web_authn_passwordless_policy.attestation_conveyance_preference
      authenticator_attachment          = web_authn_passwordless_policy.authenticator_attachment
      require_resident_key              = web_authn_passwordless_policy.require_resident_key
      user_verification_requirement     = web_authn_passwordless_policy.user_verification_requirement
      create_timeout                    = web_authn_passwordless_policy.create_timeout
      avoid_same_authenticator_register = web_authn_passwordless_policy.avoid_same_authenticator_register
      acceptable_aaguids                = web_authn_passwordless_policy.acceptable_aaguids
    }
  }

  default_default_client_scopes  = each.value.default_default_client_scopes
  default_optional_client_scopes = each.value.default_optional_client_scopes
}
