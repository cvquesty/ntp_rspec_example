require 'beaker-rspec'

RSpec.configure do |c|
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do

    # Install module
    hosts.each do |host|
      on host, install_puppet
      on host, "/bin/echo '' > #{host['hieraconf']}"
      on host, "mkdir -p #{host['distmoduledir']}/ntp"
      %w(files lib manifests templates metadata.json).each do |file|
        scp_to host, "#{proj_root}/#{file}", "#{host['distmoduledir']}/ntp"
      end
    end
  end
end
