require_relative '../spec_helper'

describe 'ohai-plugin::default' do

  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new() do |node, server|

        # Example setting node attributes and network defaults
        # node.automatic_attrs['hostname'] = 'dgoradia-atlas-vagrant'
        # node.automatic_attrs['fqdn'] = 'dgoradia-atlas-vagrant.local'
        # node.automatic_attrs['network'] = JSON.parse(File.read(File.expand_path(File.join(File.dirname(__FILE__), '../../network.json'))))

        # Example of stubbing a data bag
        # server.create_data_bag("devices", {
        #   "dgoradia-atlas-vagrant" => parse_data_bag('devices/insight/dgoradia-atlas-vagrant.json')
        # })

      end.converge(described_recipe)
    end

    it 'should converge' do
      expect(chef_run).to include_recipe(described_recipe)
    end

    # it 'data bag does not raise an exception' do
    #   expect { chef_run }.to_not raise_error
    # end
  end

end
