#
# Cookbook:: icinga2repo_test
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

package 'icinga2' do
  options '--no-install-recommends' if node['platform'] == 'debian'
end
