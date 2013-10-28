node[:openssh][:server][:password_authentication] = boolean_to_ssh_config_value(node['secure-server']['ssh']['password_authentication'])
node[:openssh][:server][:permit_root_login] = boolean_to_ssh_config_value(node['secure-server']['ssh']['permit_root_login'])

include_recipe 'openssh::default'

private

def boolean_to_ssh_config_value(boolean)
  boolean ? 'yes' : 'no'
end
