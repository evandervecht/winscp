#
# Cookbook Name:: winscp
# Recipe:: default
#
# Copyright 2015, Schuberg Philis
#
# All rights reserved - Do Not Redistribute
#

windows_package node['winscp']['package_name'] do
  source node['winscp']['url']
  options "/DIR=\"#{node['winscp']['install_path']}\" /SP- /SUPPRESSMSGBOXES /LOG=""#{node['winscp']['log_path']}\\Install_WinScp.log"" /CLOSEAPPLICATIONS /NOICONS /COMPONENTS=""WinSCP application"" /TASKS="""
  installer_type :inno
  action :install
  not_if do
   File.exists?("#{node['winscp']['install_path']}")
  end
end