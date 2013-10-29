require 'minitest/spec'
require File.expand_path('../spec_helper', __FILE__)

describe_recipe 'secure-server::ssh' do
  SSH_CONFIG_PATH = '/etc/ssh/sshd_config'

  it 'disables password authentication' do
    assert_includes_content File.new(SSH_CONFIG_PATH), 'PasswordAuthentication no'
  end

  it 'disables root login' do
    assert_includes_content File.new(SSH_CONFIG_PATH), 'PermitRootLogin no'
  end
end
