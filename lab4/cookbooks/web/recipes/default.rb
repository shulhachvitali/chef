#
# Cookbook Name :: web
# Recipe :: default
#

if node.role?("#{node['web_server_type']['web_server_nginx']}")
	include_recipe 'web_nginx'

elsif node.role?("#{node['web_server_type']['web_server_apache']}")
	include_recipe 'web_apache'
end
