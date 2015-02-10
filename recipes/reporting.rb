#
# Cookbook Name:: chef-server12
# Recipe:: reporting
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

include_recipe "chef_server12::default"

chef_server12_package "reporting" do
  notifies :run, 'execute[reconfigure-chef-server]', :immediately
end