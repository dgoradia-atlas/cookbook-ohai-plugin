name 'ohai-plugin'
maintainer 'Atlas Digital LLC'
maintainer_email ''
license 'all_rights'
description 'Installs/Configures ohai-plugin'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.1.0'

%w( centos ubuntu windows ).each do |os|
	supports os
end

recipe 'ohai-plugin::default', 'Installs Ohai plugins'

attribute 'ohai/plugin_path',
	:display_name  => 'Ohai Plugin Path',
	:description   => 'Distribute plugins to this path',
	:type          => 'string',
	:required      => 'optional',
	:default       => '/etc/chef/ohai_plugins'

attribute 'ohai/plugins',
	:display_name  => 'Ohai Plugin Sources',
	:description   => 'Read plugins from these cookbooks and paths',
	:type          => 'hash',
	:required      => 'optional',
	:default       => {'ohai' => 'plugins'}
