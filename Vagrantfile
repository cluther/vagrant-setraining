Vagrant::Config.run do |config|

  # Routers
  config.vm.define :core1 do |core1|
    core1.vm.box = "centos-6.3-minimal"
    core1.vm.box_url = "https://dl.dropbox.com/u/50577/vagrant/centos-6.3-minimal.box"
    core1.vm.customize ["modifyvm", "core1-#{:id}", "--memory", 128]
    core1.vm.network :hostonly, "10.255.0.2", :netmask => "255.255.255.248"
    core1.vm.network :hostonly, "10.255.0.10", :netmask => "255.255.255.248"
    core1.vm.network :hostonly, "10.255.0.18", :netmask => "255.255.255.248"
    core1.vm.provision :shell, :path => "provision.sh", :args => "core1"
  end

  config.vm.define :dist1 do |dist1|
    dist1.vm.box = "centos-6.3-minimal"
    dist1.vm.box_url = "https://dl.dropbox.com/u/50577/vagrant/centos-6.3-minimal.box"
    dist1.vm.customize ["modifyvm", "dist1-#{:id}", "--memory", 128]
    dist1.vm.network :hostonly, "10.255.0.3", :netmask => "255.255.255.248"
    dist1.vm.network :hostonly, "10.77.1.2"
    dist1.vm.provision :shell, :path => "provision.sh", :args => "dist1"
  end

  config.vm.define :dist2 do |dist2|
    dist2.vm.box = "centos-6.3-minimal"
    dist2.vm.box_url = "https://dl.dropbox.com/u/50577/vagrant/centos-6.3-minimal.box"
    dist2.vm.customize ["modifyvm", "dist2-#{:id}", "--memory", 128]
    dist2.vm.network :hostonly, "10.255.0.11", :netmask => "255.255.255.248"
    dist2.vm.network :hostonly, "10.77.2.2"
    dist2.vm.provision :shell, :path => "provision.sh", :args => "dist2"
  end

  config.vm.define :dist3 do |dist3|
    dist3.vm.box = "centos-6.3-minimal"
    dist3.vm.box_url = "https://dl.dropbox.com/u/50577/vagrant/centos-6.3-minimal.box"
    dist3.vm.customize ["modifyvm", "dist3-#{:id}", "--memory", 128]
    dist3.vm.network :hostonly, "10.255.0.19", :netmask => "255.255.255.248"
    dist3.vm.network :hostonly, "10.77.3.2"
    dist3.vm.provision :shell, :path => "provision.sh", :args => "dist3"
  end

  # Zenoss Server
  config.vm.define :zenoss do |zenoss|
    zenoss.vm.box = "centos-6.3-core"
    zenoss.vm.box_url = "https://dl.dropbox.com/u/50577/vagrant/centos-6.3-core.box"
    zenoss.vm.customize ["modifyvm", "zenoss-#{:id}", "--memory", 2048]
    zenoss.vm.network :hostonly, "10.77.1.101"
    zenoss.vm.provision :shell, :path => "provision.sh", :args => "zenoss"
  end

  # Monitored Servers
  config.vm.define :server2 do |server2|
    server2.vm.box = "centos-6.3-minimal"
    server2.vm.box_url = "https://dl.dropbox.com/u/50577/vagrant/centos-6.3-minimal.box"
    server2.vm.customize ["modifyvm", "server2-#{:id}", "--memory", 128]
    server2.vm.network :hostonly, "10.77.2.101"
    server2.vm.provision :shell, :path => "provision.sh", :args => "server2"
  end

  config.vm.define :server3 do |server3|
    server3.vm.box = "centos-6.3-minimal"
    server3.vm.box_url = "https://dl.dropbox.com/u/50577/vagrant/centos-6.3-minimal.box"
    server3.vm.customize ["modifyvm", "server3-#{:id}", "--memory", 128]
    server3.vm.network :hostonly, "10.77.3.101"
    server3.vm.provision :shell, :path => "provision.sh", :args => "server3"
  end
end
