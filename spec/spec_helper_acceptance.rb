require 'beaker-rspec/spec_helper'
require 'beaker/puppet_install_helper'

hosts.each do |host|
  # Install Puppet
  run_puppet_install_helper
end

RSpec.configure do |c|
  module_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    hosts.each do |host|
      # dependency
      on host, puppet('module','install','puppetlabs-stdlib')
      copy_module_to(host, :source => module_root, :module_name => 'monit')
    end

  end
end
