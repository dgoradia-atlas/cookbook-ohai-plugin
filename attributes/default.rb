case node["platform_family"]
when "windows"
	default["ohai"]["plugin_path"] = "C:/chef/ohai_plugins"
else
	default["ohai"]["plugin_path"] = "/etc/chef/ohai_plugins"
end
default['ohai']['plugins']['ohai-plugin'] = 'plugins'
