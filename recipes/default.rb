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

template "/tmp/chef-server-config.sh" do
  source "install-chef-server.sh.erb"
  mode "0755"
end

package package_name do
  source package_local_path
  provider Chef::Provider::Package::Dpkg
  notifies :run, 'execute[chef-server-config]', :immediately
end

execute "chef-server-config" do
  action :nothing
  cwd "/tmp"
  command "/tmp/chef-server-config.sh > chef-server-config.log"
end