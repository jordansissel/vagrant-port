module VagrantPort
  class Plugin < Vagrant.plugin("2")
    name "Query forwarded ports for guests."

    command "port" do
      require_relative "command"
      next VagrantPort::Command
    end
  end
end
