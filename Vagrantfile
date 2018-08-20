Vagrant.configure("2") do |config|

  # Box Settings
  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 5116
    vb.cpus = 1
  end

  # Portforwarding
  config.vm.network "forwarded_port", guest: 8080, host: 6080
  config.vm.network "forwarded_port", guest: 80, host: 6000

  # Synced Tomcat folders
  config.vm.synced_folder "configs/", "/home/vagrant/configs"
  config.vm.synced_folder "logs/tomcat/", "/var/lib/tomcat8/logs"
  
  # Synced Tomcat folder
  #config.vm.synced_folder "webapps/", "/var/lib/tomcat8/webapps"

  # Installs Tomcat, Mysql and copies configuration-files
  config.vm.provision "shell", path: "Commands.sh"

  # Creates databases, users and grants permission
  config.vm.provision "shell", path: "Database.sh"

  # Check the repositories from GitLab, build with maven and copy to the tomcat
  config.vm.provision "shell", path: "Build.sh"
end
