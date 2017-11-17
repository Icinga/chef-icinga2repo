# frozen_string_literal: true

# Cookbook:: icinga2repo
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

case node['platform_family']
when 'raspbian', 'debian'
  include_recipe 'icinga2repo::apt'
when 'fedora', 'rhel', 'amazon'
  include_recipe 'icinga2repo::yum'
else
  raise "platform_family #{node['platform_family']} not supported"
end
