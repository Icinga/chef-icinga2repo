# frozen_string_literal: true

# Cookbook:: icinga2repo
# Recipe:: yum
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

yum_repository 'icinga2-release' do
  description node['icinga2repo']['release']['yum']['description']
  baseurl node['icinga2repo']['release']['yum']['baseurl']
  mirrorlist node['icinga2repo']['release']['yum']['mirrorlist'] if node['icinga2repo']['release']['yum']['mirrorlist']
  gpgcheck node['icinga2repo']['release']['yum']['gpgcheck']
  gpgkey node['icinga2repo']['release']['yum']['gpgkey']
  metadata_expire node['icinga2repo']['release']['yum']['metadata_expire']
  enabled node['icinga2repo']['release']['yum']['enabled']
  action node['icinga2repo']['release']['yum']['action']
end

yum_repository 'icinga2-snapshot' do
  description node['icinga2repo']['snapshot']['yum']['description']
  baseurl node['icinga2repo']['snapshot']['yum']['baseurl']
  mirrorlist node['icinga2repo']['snapshot']['yum']['mirrorlist'] if node['icinga2repo']['snapshot']['yum']['mirrorlist']
  gpgcheck node['icinga2repo']['snapshot']['yum']['gpgcheck']
  gpgkey node['icinga2repo']['snapshot']['yum']['gpgkey']
  metadata_expire node['icinga2repo']['snapshot']['yum']['metadata_expire']
  enabled node['icinga2repo']['snapshot']['yum']['enabled']
  action node['icinga2repo']['snapshot']['yum']['action']
end
