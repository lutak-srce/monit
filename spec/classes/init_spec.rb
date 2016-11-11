require 'spec_helper'
describe 'monit', :type => :class do
  context "on a Debian OS" do
    let :facts do
      {
        :osfamily                  => 'Debian',
        :operatingsystemmajrelease => '8',
      }
    end
    it { is_expected.to contain_package("monit") }
    it { is_expected.to compile.with_all_deps }
  end
end
