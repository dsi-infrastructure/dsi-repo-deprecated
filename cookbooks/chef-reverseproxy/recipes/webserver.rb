#
# Cookbook Name:: chef-reverseproxy
# Recipe:: webserver
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apache2"
include_recipe "apache2::mod_proxy_http"

item = node['fqdn'].tr(".", "_")
dbgi =  Chef::DataBagItem.load("reverseproxies", "#{item}")

sites_enabled = dbgi['members']
sites_enabled = sites_enabled.tr(" ", "").split(",")

sites_enabled.each do |cle|
        # Set up the Apache virtual host reverse proxy
        web_app dbgi["#{cle}"]['server_name'] do 
                server_name dbgi["#{cle}"]['server_name']
                server_name_proxy dbgi["#{cle}"]['server_name_proxy']
 
                template "test.gov.pf.conf.erb" 
                log_dir node['apache']['log_dir'] 
        end
        hostsfile_entry dbgi["#{cle}"]['server_ip_proxy'] do
                hostname  dbgi["#{cle}"]['server_name_proxy']
                action    :create_if_missing
        end
end
