node.override[:openssh][:server][:password_authentication] = ConfigHelper.boolean_to_ssh_config_value(node['secure-server']['ssh']['password_authentication'])
node.override[:openssh][:server][:permit_root_login] = ConfigHelper.boolean_to_ssh_config_value(node['secure-server']['ssh']['permit_root_login'])

include_recipe 'openssh::default'
