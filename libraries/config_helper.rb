module ConfigHelper
  def self.boolean_to_ssh_config_value(boolean)
    boolean ? 'yes' : 'no'
  end
end
