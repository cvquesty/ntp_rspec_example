require 'spec_helper_acceptance'

packagename = 'ntp'

describe 'ntp::install class' do
  it 'installs the package' do
    apply_manifest(%{
      class { 'ntp': }
    }, :catch_failures => true)
  end

  describe package(packagename) do
    it { should be_installed }
  end
end
