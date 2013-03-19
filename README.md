# vagrant port plugin

This plugin helps you query what guest port is forwarded from a host port.

This is useful when you use randomly selected ports or have simply forgotten
the forwarded port mapping.

## Installing

```vagrant plugin install vagrant-port```

## The Vagrantfile

You can use whatever forwarded ports you want, but I randomize them like this:

```ruby
Vagrant::Config.run do |config|
  # Using random ports is NOT required, but is shown here for an example.
  config.vm.forward_port 1234, rand(30000) + 1024
  config.vm.forward_port 80, rand(30000) + 1024
  config.vm.forward_port 443, rand(30000) + 1024
end
```

## Querying

The `vagrant port` command is provided by this plugin.

The command takes a port number on the guest vm and prints the port number
forwarded by the host.

Examples:

```
% vagrant port 22
2222
% vagrant port 9200
21595
```
