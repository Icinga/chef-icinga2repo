# frozen_string_literal: true

# Cookbook:: icinga2repo
# Recipe:: apt
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

apt_repository 'icinga2-release' do
  uri node['icinga2repo']['release']['apt']['uri']
  distribution node['icinga2repo']['release']['apt']['distribution']
  components node['icinga2repo']['release']['apt']['components']
  keyserver node['icinga2repo']['release']['apt']['keyserver'] unless node['icinga2repo']['release']['apt']['keyserver'].nil?
  key node['icinga2repo']['release']['apt']['key']
  deb_src node['icinga2repo']['release']['apt']['deb_src']
  action node['icinga2repo']['release']['apt']['action']
end

apt_repository 'icinga2-snapshot' do
  uri node['icinga2repo']['snapshot']['apt']['uri']
  distribution node['icinga2repo']['snapshot']['apt']['distribution']
  components node['icinga2repo']['snapshot']['apt']['components']
  keyserver node['icinga2repo']['snapshot']['apt']['keyserver'] unless node['icinga2repo']['snapshot']['apt']['keyserver'].nil?
  key node['icinga2repo']['snapshot']['apt']['key']
  deb_src node['icinga2repo']['snapshot']['apt']['deb_src']
  action node['icinga2repo']['snapshot']['apt']['action']
end
