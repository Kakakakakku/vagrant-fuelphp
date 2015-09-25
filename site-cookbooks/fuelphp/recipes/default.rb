#
# Cookbook Name:: fuelphp
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "install oil" do
  command "curl get.fuelphp.com/oil | sh"
  user "root"
end

execute "install fuel" do
  command <<-EOL
    cd /home/vagrant
    oil create fuelphp
  EOL
  user "vagrant"
end

execute "composer update" do
  command <<-EOL
    cd /home/vagrant/fuelphp
    php composer.phar update
  EOL
  user "vagrant"
end
