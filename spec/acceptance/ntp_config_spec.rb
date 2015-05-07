require 'spec_helper_acceptance'

describe 'ntp::config class' do

  line = 'server ntp.yourdomain.com'
  config = '/etc/ntp.conf'

  it 'sets up ntp.conf' do
    apply_manifest(%{
      class { 'ntp': }
    }, :catch_failures => true)
  end

  describe file("#{config}") do
    it { should be_file }
    its(:content) { should match line }
  end
end

