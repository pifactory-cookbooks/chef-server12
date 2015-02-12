#
# Cookbook Name:: chef-server12
# Recipe:: default
#
# Copyright (C) 2015 Alexander Dvorkovyy
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package_url = node['chef-server']['download_url']
package_name = ::File.basename(package_url)
package_local_path = "#{Chef::Config[:file_cache_path]}/#{package_name}"

remote_file package_local_path do
  source package_url
end

package package_name do
  source package_local_path
  provider Chef::Provider::Package::Dpkg
  notifies :create, 'template[/etc/opscode/chef-server.rb]', :immediately
  notifies :run, 'execute[create-user]', :immediately
end

template '/etc/opscode/chef-server.rb' do
  source 'chef-server.rb.erb'

  action :nothing
  notifies :run, 'execute[reconfigure-chef-server]', :immediately
end

execute "reconfigure-chef-server" do
  command "chef-server-ctl reconfigure"
  action :nothing
end

execute "create-user" do
  command "chef-server-ctl user-create #{node['chef-server']['user']['username']}" +
          " \"#{node['chef-server']['user']['first_name']}\"" +
          " \"#{node['chef-server']['user']['last_name']}\"" +
          " \"#{node['chef-server']['user']['email']}\"" +
          " \"#{node['chef-server']['user']['password']}\"" +
          " --filename #{node['chef-server']['pem-export-dir']}/#{node['chef-server']['user']['username']}.pem"

  action :nothing
  notifies :run, 'execute[create-org]', :immediately
  only_if { node['chef-server']['user']['create'] }
end

execute "create-org" do
  command "chef-server-ctl org-create #{node['chef-server']['org']['short_name']}" +
              " \"#{node['chef-server']['org']['long_name']}\"" +
              " --association_user #{node['chef-server']['user']['username']}" +
              " --filename #{node['chef-server']['pem-export-dir']}/#{node['chef-server']['org']['short_name']}-validation.pem"

  action :nothing
end