include_recipe 'firewall::default'

node['secure-server']['firewall']['rules'].each_with_index do |rule, i|
  firewall_rule "rule #{i}" do
    port     rule[:port]
    protocol rule[:protocol] || :tcp
    action   rule[:action].to_sym
  end
end

firewall 'ufw' do
  action :enable
end
