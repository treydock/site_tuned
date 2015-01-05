require 'puppetlabs_spec_helper/module_spec_helper'

shared_context :defaults do
  let :default_facts do
    {
      :kernel                     => 'Linux',
      :osfamily                   => 'RedHat',
      :operatingsystem            => 'CentOS',
      :operatingsystemrelease     => '6.5',
      :operatingsystemmajrelease  => '6',
    }
  end
end

at_exit { RSpec::Puppet::Coverage.report! }
