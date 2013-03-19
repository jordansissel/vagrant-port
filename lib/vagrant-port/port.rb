module VagrantPort
  class Port < Vagrant.plugin(2)
    name "Port Query"

    command "port" do
      with_target_vms(argv) do |machine|
        puts machine
      end
      return 0
    end
  end
end
