#
# Cookbook Name:: logrotate
# Recipe:: default
#
# Copyright 2009-2013, Chef Software, Inc.
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

package 'logrotate'

directory File.join(node['logrotate']['conf_dir'], "logrotate.d") do
  owner node['root_user']
  group node['root_group']
  mode "0755"
  action :create
end

if ["solaris", "freebsd"].include?(node['platform'])
  cron "logrotate" do
    minute "35"
    hour "7"
    command "/usr/sbin/logrotate /etc/logrotate.conf"
  end
end
