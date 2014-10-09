#
# Cookbook Name:: cron-apt
# Recipe:: default
#
# Copyright (C) 2014 Rackspace, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'cron'
package 'cron-apt'

file '/etc/cron-apt/action.d/3-download' do
  action :delete
end

cookbook_file '/etc/cron-apt/action.d/0-update' do
  source '0-update'
  action :create
end

cookbook_file '/etc/cron-apt/action.d/5-upgrade' do
  source '5-upgrade'
  action :create
end

cookbook_file '/etc/cron-apt/action.d/6-autoremove' do
  source '6-autoremove'
  action :create
end

cron_d 'cron-apt' do
  minute 0
  hour 4
  command '/usr/sbin/cron-apt'
  user 'root'
end
