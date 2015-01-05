require 'spec_helper'

describe 'site_tuned' do
  include_context :defaults

  let(:facts) { default_facts }
  let(:pre_condition) do
    "
    class { 'tuned':
      profile => 'fhgfs-store',
      source  => 'puppet:///modules/site_tuned/fhgfs-store',
    }
    "
  end

  it { should contain_class('tuned') }

  it do
    should contain_file('/etc/tune-profiles/fhgfs-store').with({
      :source => 'puppet:///modules/site_tuned/fhgfs-store',
    })
  end
end
