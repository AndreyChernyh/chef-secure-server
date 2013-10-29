%w(ssh firewall fail2ban).each {|recipe| include_recipe "#{cookbook_name}::#{recipe}"}
