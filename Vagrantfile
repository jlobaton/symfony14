# -*- mode: ruby -*-
# vi: set ft=ruby :

# -----------------------------------------------------------------------------
# Configuration:
# -----------------------------------------------------------------------------
# web_apps:
#   app_identifier => { .. app settings .. }
#
# App Settings:
# ------------------------------------------------------
# host_project_folder:  Where project resides on the host
#                         default: relative to the vagrant folder
# guest_project_folder: Where the project resides in the guest VM
# guest_docroot:        Where Apache serves files within the guest VM
# server_name:          Same as Apache's ServerName
# server_aliases:       Same as Apache's ServerAlias
 
php_timezone_cli = "America/New_York"

web_apps = {
  "project1" => {
    "host_project_folder"  => "/directorio/carpeta_de_trabajo",
    "guest_project_folder" => "/directorio/carpeta_de_trabajo",
    "guest_docroot"        => "/directorio/carpeta_de_trabajo/web",
    "server_name"          => "localhost",
    "server_aliases"       => ["*.carpeta_de_trabajo"],
    "php_timezone"         => "America/New_York"
  }
}

# You can probably get away with not changing these:
# guest_ip:   IP address that guest is accessible from on the host
# host_port:  Guest VM will forward port 80 to this port on the host

guest_ip              = "33.33.33.10"
host_port             = 8080
xdebug_remote_enabled = 1
xdebug_remote_host    = "33.33.33.1"
xdebug_remote_port    = 9000
host_port_mysql       = 33060

# -----------------------------------------------------------------------------


Vagrant::Config.run do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.network :hostonly, guest_ip
  config.vm.network :bridged
  config.vm.forward_port 80, host_port
   #config.vm.forward_port 3306, host_port_mysq
  config.vm.network :forwarded_port, guest: 3306, host: host_port_mysql

  web_apps.each do |id, web_app|
    config.vm.share_folder(id, web_app["guest_project_folder"], web_app["host_project_folder"], :owner => "vagrant")
  end

config.vm.provision "shell", path: "install_serv_web.sh"

#  config.vbguest.auto_update = false

  # do NOT download the iso file from a webserver
 # config.vbguest.no_remote = true

#  config.vm.provision :chef_solo do |chef|
 #   chef.cookbooks_path = "cookbooks"
  #  chef.add_recipe "vagrant_main"
   # chef.json = {
   #   "app" => {
    #    "web_apps"         => web_apps,
     #   "php_timezone_cli" => php_timezone_cli
     # },
    #  "xdebug" => {
     #   "remote_enable" => xdebug_remote_enabled,
    #    "remote_host"   => xdebug_remote_host,
    #    "remote_port"   => xdebug_remote_port
    #  }
  #  }
 # end
end
