# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "raring"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box"
  #config.vm.forward_port 5000, 5000

  config.vm.network :forwarded_port, guest: 80, host: 8080

  #config.vm.customize [ "modifyvm", :id, "--memory", 512 ]

  apt_update          = "apt-get update;"
  restart             = "shutdown -r +1;"
  aufs_supp           = "apt-get install linux-image-extra-`uname -r` dkms -y;"
  add_docker_repo_key = "sudo sh -c \"curl http://get.docker.io/gpg | apt-key add -\";"
  add_docker_repo     = "sudo sh -c \"echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list\";"
  install_docker      = "apt-get install -q -y --force-yes lxc-docker;"
  install_htop        = "apt-get install htop;"
  install_tree        = "apt-get install tree;"
  install_git         = "apt-get install git;"
  install_tig         = "apt-get install tig;"
  
  icmd = "#{apt_update}"\
           "#{aufs_supp}"\
           "#{add_docker_repo}"\
           "#{add_docker_repo_key}"\
           "#{apt_update}"\
           "#{install_docker}"\
           "#{install_htop}"\
           "#{install_tree}"
           "#{install_git}"\
           "#{install_tig}"

  config.vm.provision :shell, :inline => icmd
end
