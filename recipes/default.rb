%w(ssh fail2ban).each { |recipe| include_recipe "#{cookbook_name}::#{recipe}" }
include_recipe "#{cookbook_name}::firewall" if platform?('ubuntu', 'debian')
