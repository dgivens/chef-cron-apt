#
# Cookbook Name:: cron-apt
# Recipe:: default
#
# Copyright (C) 2014 Daniel Givens
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

cookbook_file '/etc/cron-apt/config.d/apt_env' do
  source 'config-env'
  action :create
end

cron_d 'cron-apt' do
  minute node['cron_apt']['minute']
  hour node['cron_apt']['hour']
  day node['cron_apt']['day']
  month node['cron_apt']['month']
  weekday node['cron_apt']['weekday']
  command 'test -x /usr/sbin/cron-apt && /usr/sbin/cron-apt &> /dev/null'
  user 'root'
end
