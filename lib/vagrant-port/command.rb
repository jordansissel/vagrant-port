module VagrantPort
  class Command < Vagrant.plugin("2", :command)
    Settings = Struct.new(:machines)
    def execute
      require "optparse"
      settings = Settings.new
      settings.machines = []
      options = OptionParser.new do |o|
        o.banner = "Query which host port is mapped to the given guest port.\n" \
          "Usage: vagrant port <guest_port_number>"

        o.on("-m MACHINE", "The machine to query") do |value|
          settings.machines << value
        end
      end
      settings.machines = ["default"] if settings.machines.empty?

      argv = parse_options(options)
      if argv.nil? || argv.empty?
        puts options.help
        return 1
      end

      with_target_vms(settings.machines) do |machine|
        machine.provider.driver.read_forwarded_ports.each do |active, name, host, guest|
          puts host if argv.include?(guest.to_s)
        end
      end

      return 0
    end
  end
end
