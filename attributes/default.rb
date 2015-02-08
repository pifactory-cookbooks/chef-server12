default['chef-server']['download_url']="https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/chef-server-core_12.0.2-1_amd64.deb"

default['chef-server']['create-user']=true
# this directory must exist
default['chef-server']['pem-dir']=ENV['HOME']
default['chef-server']['username']="admin"
# insecure password, must be changed right after install
default['chef-server']['password']="password"
default['chef-server']['user_email']="no_reply@example.com"
default['chef-server']['user_first_name']="Chef"
default['chef-server']['user_last_name']="Admin"
default['chef-server']['org_short_name']="yourco"
default['chef-server']['org_long_name']="Your Company"

default['chef-server']['install-web-ui']=true
default['chef-server']['install-push-jobs-server']=true
default['chef-server']['install-reporting']=true

default['chef-server']['install-backup-scripts']=true
default['chef-server']['backup_path']="/var/backups/chef-server"
default['chef-server']['scripts_path']="/opt/chef/bin"
