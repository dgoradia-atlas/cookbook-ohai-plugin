# -*- mode: ruby -*-
# vi: set ft=ruby :
# This is a Vagrant configuration file. It can be used to set up and manage
# virtual machines on your local system or in the cloud. See http://downloads.vagrantup.com/
# for downloads and installation instructions, and see http://docs.vagrantup.com/v2/
# for more information and configuring and using Vagrant.

required_plugins = %w(vagrant-omnibus vagrant-berkshelf vagrant-butcher vagrant-cachier)

plugins_install = required_plugins.select { |plugin| not Vagrant.has_plugin? plugin }
if not plugins_install.empty?
  puts "Installing plugins: #{plugins_install.join(' ')}"
  system "vagrant plugin install #{plugins_install.join(' ')}"
  exec "vagrant #{ARGV.join(' ')}"
end

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  #config.vm.box = "opscode-ubuntu-12.04-i386"
  #config.vm.box = "opscode-centos-6.6"
  #config.vm.box = "opscode-ubuntu-12.04"
  #config.vm.box = "ie-windows-7"
  #config.vm.box = "opscode-centos-7.1"
  config.vm.box = "centos71"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  #config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04-i386_provisionerless.box"
  #config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.6_chef-provisionerless.box"
  #config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-12.04_chef-provisionerless.box"
  #config.vm.box_url = "http://10.1.70.60/vagrant/boxes/windows/ie-windows-7.box"
  #config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.1_chef-provisionerless.box"
  config.vm.box_url = "http://10.1.70.60/vagrant/boxes/centos/opscode_centos-7.1_chef-insight-nobiosdevname.box"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  # This can be set to the host name you wish the guest machine to have. Vagrant
  # will automatically execute the configuration necessary to make this happen.
  config.vm.hostname = "#{ENV['CHEF_USER']}-vagrant"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # port 8080 on the virtual machine is forwarded to port 9090 on the host.
  # This will allow the virtual machine to communicate of the common proxy port 8080.
  config.vm.network :forwarded_port, guest: 8080, host: 9090

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "192.168.254.19", auto_config: false

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  #config.vm.synced_folder "shared", "/shared"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "cookbooks"
  #   chef.roles_path = "roles"
  #   chef.data_bags_path = "data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end

  # vagrant-cachier options
  config.cache.scope = :box

  # vagrant-butcher options
  #config.butcher.verify_ssl = false

  # vagrant-erkshelf options
  #config.berkshelf.enabled = true

  # Chef Provisioner
  #config.omnibus.chef_version = :latest

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  config.vm.provision :chef_client do |chef|
    chef.installer_download_path = "//tmp/vagrant-cache/vagrant-omnibus"
    chef.chef_server_url = ENV['KNIFE_CHEF_SERVER']
    chef.validation_client_name = "#{ENV['CHEF_ORGNAME']}-validator"
    chef.validation_key_path = "#{ENV['KNIFE_VALIDATION_KEY_FOLDER']}/#{ENV['CHEF_ORGNAME']}-validator.pem"
    chef.node_name = "#{ENV['CHEF_USER']}-vagrant"
    chef.environment = "development"
    #chef.add_recipe "dhcp::default"
    #chef.add_role "dhcp"
    chef.run_list = ["recipe[]"]
  end

end
