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

      argv = parse_options(options)
      if argv.nil? || argv.empty?
        puts options.help
        return 1
      end

      settings.machines = ["default"] if settings.machines.empty?
      found = false
      with_target_vms(settings.machines) do |machine|
        machine.provider.driver.read_forwarded_ports.each do |active, name, host, guest|
          if argv.include?(guest.to_s)
            puts host
            found = true
          end
        end
      end

      return 1 if !found # fail if no forwarded ports found.
      return 0
    end
  end
end
