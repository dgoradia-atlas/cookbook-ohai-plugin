[![wercker status](https://app.wercker.com/status/19c1fb9bdaec9cc62a2e25c3a828e9a7/s "wercker status")](https://app.wercker.com/project/bykey/19c1fb9bdaec9cc62a2e25c3a828e9a7)
Ohai Plugin
===========
Installs Ohai plugins to be used be nodes.

Usage
-----
Include this recipe in your cookbook and place your plugins in the
`files/default/plugins` directory.

Add the attribute, replacing `cookbook_name` with the name of your own cookbook.
```
default['ohai']['plugins']['cookbook_name'] = 'plugins'
```
