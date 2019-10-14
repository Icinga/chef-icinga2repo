#
# Cookbook:: icinga2repo
# Resource:: icinga2_repo
#
# Copyright:: 2017, The Authors, All Rights Reserved.

resource_name :icinga2_repo
default_action :add

property :enable_snapshots, [true, false], default: false

action :add do
  case node['platform_family']

  when 'rhel', 'fedora', 'amazon'
    include_recipe 'yum-epel'

    yum_repository 'icinga2-release' do
      description node['icinga2repo']['release']['yum']['description']
      baseurl node['icinga2repo']['release']['yum']['baseurl']
      mirrorlist node['icinga2repo']['release']['yum']['mirrorlist'] if node['icinga2repo']['release']['yum']['mirrorlist']
      gpgcheck node['icinga2repo']['release']['yum']['gpgcheck']
      gpgkey node['icinga2repo']['release']['yum']['gpgkey']
      metadata_expire node['icinga2repo']['release']['yum']['metadata_expire']
      enabled node['icinga2repo']['release']['yum']['enabled']
      action :create
    end

    yum_repository 'icinga2-snapshot' do
      description node['icinga2repo']['snapshot']['yum']['description']
      baseurl node['icinga2repo']['snapshot']['yum']['baseurl']
      mirrorlist node['icinga2repo']['snapshot']['yum']['mirrorlist'] if node['icinga2repo']['snapshot']['yum']['mirrorlist']
      gpgcheck node['icinga2repo']['snapshot']['yum']['gpgcheck']
      gpgkey node['icinga2repo']['snapshot']['yum']['gpgkey']
      metadata_expire node['icinga2repo']['snapshot']['yum']['metadata_expire']
      enabled new_resource.enable_snapshots
      action :create
    end

  when 'debian'
    apt_repository 'icinga2-release' do
      uri node['icinga2repo']['release']['apt']['uri']
      distribution node['icinga2repo']['release']['apt']['distribution']
      components node['icinga2repo']['release']['apt']['components']
      keyserver node['icinga2repo']['release']['apt']['keyserver'] unless node['icinga2repo']['release']['apt']['keyserver'].nil?
      key node['icinga2repo']['release']['apt']['key']
      deb_src node['icinga2repo']['release']['apt']['deb_src']
      action :add
    end

    apt_repository 'icinga2-snapshot' do
      uri node['icinga2repo']['snapshot']['apt']['uri']
      distribution node['icinga2repo']['snapshot']['apt']['distribution']
      components node['icinga2repo']['snapshot']['apt']['components']
      keyserver node['icinga2repo']['snapshot']['apt']['keyserver'] unless node['icinga2repo']['snapshot']['apt']['keyserver'].nil?
      key node['icinga2repo']['snapshot']['apt']['key']
      deb_src node['icinga2repo']['snapshot']['apt']['deb_src']
      action :add
      only_if { new_resource.enable_snapshots }
    end

    if node['platform'] == 'debian' && node['platform_version'].to_i >= 9
      # The debian-backports repository is required starting from Icinga2 v2.11
      apt_repository "#{node['lsb']['codename']}-backports" do
        uri 'https://deb.debian.org/debian'
        distribution "#{node['lsb']['codename']}-backports"
        components ['main']
        action :add
      end
    end

  else
    raise "The platform_family '#{node['platform_family']}' is not supported by the icinga2_repo resource."
  end
end

action :remove do
  case node['platform_family']

  when 'rhel', 'fedora', 'amazon'
    yum_repository 'icinga2-release' do
      action :delete
    end

    yum_repository 'icinga2-snapshot' do
      action :delete
      only_if { new_resource.enable_snapshots }
    end

  when 'debian'
    apt_repository 'icinga2-release' do
      action :remove
    end

    apt_repository 'icinga2-snapshot' do
      action :remove
      only_if { new_resource.enable_snapshots }
    end

  else
    raise "The platform_family '#{node['platform_family']}' is not supported by the icinga2_repo resource."
  end
end
