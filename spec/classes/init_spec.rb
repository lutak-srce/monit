require 'spec_helper'
describe 'monit', :type => :class do
  context "on a Debian OS" do
    it { is_expected.to compile.with_all_deps }

    it { should contain_class('monit::package') }
    it { should contain_class('monit::config') }
    it { should contain_class('monit::service') }

    describe "monit::config" do
      it { should contain_file('/etc/monit/monitrc').with_owner('root') }
      it { should contain_file('/etc/monit/monitrc').with_group('root') }
      it { should contain_file('/etc/monit/monitrc').with_mode('0600') }
      it { should contain_file('/etc/monit/templates/rootbin').with_owner('root') }
      it { should contain_file('/etc/monit/templates/rootbin').with_group('root') }
      it { should contain_file('/etc/monit/templates/rootbin').with_mode('0644') }
      it { should contain_file('/etc/monit/templates/rootrc').with_owner('root') }
      it { should contain_file('/etc/monit/templates/rootrc').with_group('root') }
      it { should contain_file('/etc/monit/templates/rootrc').with_mode('0644') }
      it { should contain_file('/etc/monit/templates/rootstrict').with_owner('root') }
      it { should contain_file('/etc/monit/templates/rootstrict').with_group('root') }
      it { should contain_file('/etc/monit/templates/rootstrict').with_mode('0644') }
    end

    describe 'monit::package' do
      let(:params) {{ :package_ensure => 'present', :package_name => ['monit'], :package_manage => true, }}

      it { should contain_package('monit').with(
        :ensure => 'present'
      )}

      describe 'should allow package ensure to be overridden' do
        let(:params) {{ :package_ensure => 'latest', :package_name => ['monit'], :package_manage => true, }}
        it { should contain_package('monit').with_ensure('latest') }
      end

      describe 'should allow the package name to be overridden' do
        let(:params) {{ :package_ensure => 'present', :package_name => ['blah'], :package_manage => true, }}
        it { should contain_package('blah') }
      end

      describe 'should allow the package to be unmanaged' do
        let(:params) {{ :package_manage => false, :package_name => ['monit'], }}
        it { should_not contain_package('monit') }
      end
    end

    describe 'monit::service' do
      let(:params) {{
        :service_manage => true,
        :service_enable => true,
        :service_ensure => 'running',
        :service_name   => 'monit'
      }}

      describe 'with defaults' do
        it { should contain_service('monit').with(
          :enable => true,
          :ensure => 'running',
          :name   => 'monit'
        )}
      end

      describe 'service_ensure' do
        describe 'when overridden' do
          let(:params) {{ :service_name => 'monit', :service_ensure => 'stopped' }}
          it { should contain_service('monit').with_ensure('stopped') }
        end
      end

      describe 'service_manage' do
        let(:params) {{
          :service_manage => false,
          :service_enable => true,
          :service_ensure => 'running',
          :service_name   => 'monitd',
        }}

        it 'when set to false' do
          should_not contain_service('monit').with({
            'enable' => true,
            'ensure' => 'running',
            'name'   => 'monitd'
          })
        end
      end
    end

  end
end
