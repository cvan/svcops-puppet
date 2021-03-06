# Define settings and supervisor for zambonidashboard
define marketplace::apps::zambonidashboard(
    $installdir,
    $settings, # content of settings file.
    $port,
    $apache_domain = undef,
    $user = 'apache',
    $use_nginx = true
) {
    $dash_name = $name
    file {
        "${installdir}/zamboni_dashboard/settings_local.py":
            content => $settings;
    }

    gunicorn::instance {
        $dash_name:
            port           => $port,
            user           => $user,
            appmodule      => 'zamboni_dashboard:app',
            appdir         => $installdir,
            nginx_upstream => $use_nginx,
            gunicorn       => "${installdir}/venv/bin/gunicorn";
    }

    if $apache_domain {
        apache::vserverproxy {
            $apache_domain:
                proxyto => "http://localhost:${port}";

        }
    }

    supervisord::service {
        "${dash_name}-fetch-nagios-status":
            command => "${installdir}/venv/bin/python manage.py fetch_nagios_state",
            app_dir => $installdir,
            user    => 'apache';
    }
}
