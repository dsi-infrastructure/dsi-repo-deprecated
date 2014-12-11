#
# Cookbook Name:: chef-iscsi
# Recipe:: default
#
# Copyright (C) 2014 PE, pf.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

package 'open-iscsi' do
  package_name 'open-iscsi'
  action :upgrade
end

file '/usr/local/bin/attachAllIscsiTargets.sh' do
  content 'files/default/attachAllIscsiTargets.sh'
  owner 'root'
  group 'root'
  mode '0750'
  action :create
end

template '/etc/init.d/iscsi' do
  source 'iscsi.erb'
  mode '0755'
  owner 'root'
  group 'root'
  variables({
    :date => Time.now,
    :portal => Array( default['chef-iscsi']['portal'] )
  })
  only_if node['chef-iscsi']['ip_portal']
  notifies :restart, 'service[iscsi]', :immediately
end

