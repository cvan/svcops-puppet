# Creates zamboni settings file.
define marketplace::apps::zamboni::settings(
    $broker_url,
    $builder_secret_key,
    $caches_default_location,
    $databases_default_url,
    $databases_slave_url,
    $email_blacklist,
    $email_host,
    $es_hosts,
    $google_analytics_credentials,
    $graphite_host,
    $graphite_port,
    $graphite_prefix,
    $metlog_conf_sender_host,
    $metlog_conf_sender_port,
    $netapp_storage_root,
    $recaptcha_private_key,
    $recaptcha_public_key,
    $redirect_secret_key,
    $redis_backends_cache,
    $redis_backends_cache_slave,
    $redis_backends_master,
    $redis_backends_slave,
    $responsys_id,
    $services_database_url,
    $statsd_host,
    $statsd_port,
    $statsd_prefix,
    $addons_paypal_app_id,
    $addons_paypal_embedded_auth_user,
    $addons_paypal_embedded_password,
    $addons_paypal_embedded_signature,
    $addons_responsys_id,
    $addons_secret_key,
    $addons_sentry_dsn,
    $mkt_app_purchase_secret,
    $mkt_broker_url,
    $mkt_carrier_urls,
    $mkt_developers_oauth_key,
    $mkt_developers_oauth_secret,
    $mkt_inapp_key_path,
    $mkt_monolith_oauth_key,
    $mkt_monolith_oauth_secret,
    $mkt_monolith_password,
    $mkt_paypal_app_id,
    $mkt_paypal_chains_email,
    $mkt_paypal_embedded_auth_user,
    $mkt_paypal_embedded_password,
    $mkt_paypal_embedded_signature,
    $mkt_secret_key,
    $mkt_sentry_dsn,
    $mkt_signed_apps_reviewer_server,
    $mkt_signed_apps_server,
    $mkt_signing_server,
    $mkt_solitude_oauth_key,
    $mkt_solitude_oauth_secret,
    $mkt_webapps_receipt_key,
    $mkt_webapps_receipt_url,
    $mkt_webtrends_password,
    $mkt_webtrends_username,
    $aws_access_key_id = '',
    $aws_secret_access_key = '',
    $aws_storage_bucket_name = '',
    $secret_key = '',
    $addons_paypal_cgi_auth_password = '',
    $addons_paypal_cgi_auth_signature = '',
    $addons_paypal_cgi_auth_user = '',
    $addons_paypal_chains_email = '',
    $addons_paypal_email = '',
    $addons_paypal_embedded_auth_password = '',
    $addons_paypal_embedded_auth_signature = '',
    $addons_webapps_receipt_key = '',
    $mkt_bluevia_secret = '',
    $mkt_paypal_cgi_auth_password = '',
    $mkt_paypal_cgi_auth_signature = '',
    $mkt_paypal_cgi_auth_user = '',
    $mkt_paypal_email = '',
    $mkt_paypal_embedded_auth_password = '',
    $mkt_paypal_embedded_auth_signature = '',
    $mkt_signed_apps_key = ''
) {
    $app_dir = $name
    file {
        "${app_dir}/private_base.py":
            content => template('marketplace/apps/zamboni/settings/private_base.py');

        "${app_dir}/private_addons.py":
            content => template('marketplace/apps/zamboni/settings/private_addons.py');

        "${app_dir}/private_mkt.py":
            content => template('marketplace/apps/zamboni/settings/private_mkt.py');
    }
}
