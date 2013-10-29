require 'minitest/spec'
require File.expand_path('../spec_helper', __FILE__)

describe_recipe 'secure-server::ssh' do
  def ufw_status
    @ufw_status ||= shell_out('ufw status')
  end

  it 'enables ufw' do
    assert ufw_status.stdout.include?('Status: active')
  end

  it 'allows SSH' do
    assert_match /22\/tcp\s+ALLOW/, ufw_status.stdout
  end

  it 'allows HTTP' do
    assert_match /80\/tcp\s+ALLOW/, ufw_status.stdout
  end
end
