#
# Cookbook Name:: chef-caimito
# Recipe:: default
#
# Copyright (C) 2014 peychart@mail.pf
#
# All rights reserved - Do Not Redistribute except under the GNU V3 licence
#
package 'unzip' do
  package_name 'unzip'
  action :upgrade
end

url = node['chef-caimito']['download_url']
prefix = node['chef-caimito']['prefix']
bash "wget" do
  code "cd /tmp && wget #{url} && cd #{prefix} && unzip -q -o -a /tmp/$(basename #{url}) && mkdir caimito/logs"
  not_if do ::File.exists?("#{prefix}/caimito/logs") end
end
puts "wget #{url} done..."

template "#{prefix}/caimito/conf/Catalina/localhost/ROOT.xml" do
  source 'ROOT.xml.erb'
  mode 0644
  variables({
    :prefix => node['chef-caimito']['prefix'],
    :derbyUsername => node['chef-caimito']['derbyDatabase']['username'],
    :derbyPassword => node['chef-caimito']['derbyDatabase']['password'],
    :mysqlUsername => node['chef-caimito']['mysqlDatabase']['username'],
    :mysqlPassword => node['chef-caimito']['mysqlDatabase']['password']
  })
end

template "#{prefix}/caimito/bin/setenv.sh" do
  source 'setenv.sh.erb'
  mode 0644
  variables({
    :prefix => node['chef-caimito']['prefix']
  })
end

template "#{prefix}/caimito/source/ngasi/caimito/resource/FileResourceObj.java" do
  source 'FileResourceObj.java.erb'
  mode 0644
  variables({
    :drive => node['chef-caimito']['resource']['file']['resource.dir']
  })
end

i=1; while i do
  i = node['chef-caimito']['resource']['file']['resource.dir'].sub(/\/$/, '').index('/', i)
  if i
    filename = node['chef-caimito']['resource']['file']['resource.dir'][0..i]; i += 1
  else
    filename = node['chef-caimito']['resource']['file']['resource.dir']
  end
  directory filename do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end
end if node['chef-caimito']['resource']['type'].eql? 'file'

template "#{prefix}/caimito/webapps/WEB-INF/caimito/config.properties" do
  source 'config.properties.erb'
  mode 0644
  variables({
    :prefix => node['chef-caimito']['prefix'],
    :type => node['chef-caimito']['resource']['type'],
    :storage => node['chef-caimito']['resource'][ node['chef-caimito']['resource']['type'] ]
  })
end

template "#{prefix}/caimito/webapps/WEB-INF/jamun/server.json" do
  source 'server.json.erb'
  mode 0644
  variables({
    :mysqlUsername => node['chef-caimito']['admin']['username'],
    :mysqlPassword => node['chef-caimito']['admin']['password'],
    :ldapAuth => node['chef-caimito']['ldap']
  })
end

template '/etc/init.d/caimito' do
  source 'caimito.erb'
  mode 0755
  owner 'root'
  group 'root'
  variables({
   :date => Time.now,
   :prefix => node['chef-caimito']['prefix']
  })
  notifies :restart, 'service[caimito]', :immediately
end

service 'caimito' do
  action [ :enable ]
end
