require 'spec_helper_acceptance'
require 'specinfra'

servicename = 'ntpd'

shared_examples 'running' do
  describe service(servicename) do
    it { should be_running }
    it { should be_enabled }
  end
end

describe 'ntp::service class' do
  describe 'basic test' do
    it 'sets up the service' do
      apply_manifest(%{
        class { 'ntp': }
      }, :catch_failures => true)
    end
      it_should_behave_like 'running'
  end
end
