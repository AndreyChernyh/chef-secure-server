default['secure-server']['ssh']['password_authentication'] = true
default['secure-server']['ssh']['permit_root_login'] = true

default['secure-server']['firewall']['rules'] = [
  { port: 22,  action: :allow },
  { port: 80,  action: :allow },
  { port: 443, action: :allow }
]
