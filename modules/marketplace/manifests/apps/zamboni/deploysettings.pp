# $name is the location of zamboni
define marketplace::apps::zamboni::deploysettings(
    $cluster,
    $domain,
    $env,
    $ssh_key,
    $cron_name,
    $celery_service_prefix,
    $celery_service_mkt_prefix,
    $gunicorn = '', # should be string separated by ";"
    $multi_gunicorn = '', # should be string separated by ";"
    $pyrepo = 'https://pyrepo.addons.mozilla.org/',
    $update_ref = false,
    $load_testing = 'False' # must be a python boolean
) {
    $zamboni_dir = $name

    file {
        "${zamboni_dir}/scripts/update/deploysettings.py":
            content => template('marketplace/apps/zamboni/deploysettings.py');
    }

}