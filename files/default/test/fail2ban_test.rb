require 'minitest/spec'
require File.expand_path('../spec_helper', __FILE__)

describe_recipe 'secure-server::fail2ban' do
  it 'enables fail2ban' do
    service('fail2ban').must_be_enabled
  end

  it 'starts fail2ban' do
    service('fail2ban').must_be_running
  end
end
