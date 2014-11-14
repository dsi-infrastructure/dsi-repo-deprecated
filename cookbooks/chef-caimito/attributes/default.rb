#
# Cookbook Name:: chef-caimito
# Attributes:: chef-caimito
#
default['chef-caimito']['download_url'] = 'http://caimito-download.ngasi.com/caimito/caimito_64b.zip'
default['chef-caimito']['prefix'] = '/usr/local/bin'

default['chef-caimito']['derbyDatabase']['username'] = 'caimito'
default['chef-caimito']['derbyDatabase']['password'] = 'tiger'
default['chef-caimito']['mysqlDatabase']['username'] = 'dbuser'
default['chef-caimito']['mysqlDatabase']['password'] = 'tiger'
default['chef-caimito']['admin']['username'] = 'caimitoadmin'
default['chef-caimito']['admin']['password'] = 'caimito'

default['chef-caimito']['resource']['type'] = 'file' # 'file/openstarck', Amazon S3 comming soon...
default['chef-caimito']['resource']['file']['resource.dir'] = default['chef-caimito']['prefix'] + '/caimito/drive'
default['chef-caimito']['resource']['openstack']['cloud.store'] = 'caimito'
default['chef-caimito']['resource']['openstack']['cloud.username'] = 'system:root'
default['chef-caimito']['resource']['openstack']['cloud.api.key_password'] = 'testpass'
default['chef-caimito']['resource']['openstack']['cloud.url'] = 'http://swiftauth:8080/auth/v1.0'
#default['chef-caimito']['resource']['Amazon S3']['cloud.username'] = 'SLOS11111-1:SL11111'
#default['chef-caimito']['resource']['Amazon S3']['cloud.api.key_password'] = 'fffffffffffffffffffffffffffffffffff'
#default['chef-caimito']['resource']['Amazon S3']['url'] = 'https://dal05.objectstorage.softlayer.net/auth/v1.0/'
#default['chef-caimito']['resource']['Amazon S3']['store'] = 'caimito'

default['chef-caimito']['ldap']['enable'] = false
default['chef-caimito']['ldap']['ldap.url'] = 'ldap://ldap_server:389'
default['chef-caimito']['ldap']['ldap.authentication'] = 'simple'
default['chef-caimito']['ldap']['ldap.domain'] = 'domain'
