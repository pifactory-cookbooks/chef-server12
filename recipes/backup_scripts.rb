#
# Cookbook Name:: chef-server12
# Recipe:: backup_scripts
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

backup_path = node['chef-server']['backup_path']
scripts_path = node['chef-server']['scripts_path']

template "#{scripts_path}/chef-backup.sh" do
  source "backup.sh.erb"
  mode "0755"
end

template "#{scripts_path}/chef-restore.sh" do
  source "restore.sh.erb"
  mode "0755"
end

directory backup_path do
  owner "opscode"
  group "opscode"
end
