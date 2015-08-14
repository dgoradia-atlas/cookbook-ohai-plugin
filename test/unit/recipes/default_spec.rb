require_relative '../spec_helper'

describe 'ohai-plugin::default' do

  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new() do |node, server|
      end.converge(described_recipe)
    end

    it 'should converge' do
      expect(chef_run).to include_recipe(described_recipe)
    end

    it 'should create directory for plugins' do
      expect(chef_run).to create_remote_directory('/etc/chef/ohai_plugins').with(
        mode: '0755',
        recursive: true,
        purge: false
      )
    end

    it 'should reload ohai' do
      expect(chef_run).to_not reload_ohai('custom_plugins')
    end

  end

end
