# Hardcoded until this link returns reference to download url:
# http://www.chef.io/chef/metadata-server?p=ubuntu&pv=14.04&m=x86_64&v=12&prerelease=false&nightlies=false
default['chef-server']['download_url']="https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/chef-server-core_12.0.3-1_amd64.deb"

# this directory must exist, it will be not created
default['chef-server']['pem-export-dir']=ENV['HOME']

# user is created only if chef-server is installed
default['chef-server']['user']['create']=true
default['chef-server']['user']['username']="admin"
# insecure password, must be changed right after install
default['chef-server']['user']['password']="password"
default['chef-server']['user']['email']="no_reply@example.com"
default['chef-server']['user']['first_name']="Chef"
default['chef-server']['user']['last_name']="Admin"
default['chef-server']['org']['short_name']="yourco"
default['chef-server']['org']['long_name']="Your Company"

default['chef-server']['web-ui']['disable_sign_up']=true

default['chef-server']['backup_path']="/var/backups/chef-server"
default['chef-server']['scripts_path']="/opt/chef/bin"
