# frozen_string_literal: true

# Cookbook:: icinga2repo
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

icinga2_repo 'icinga2' do
  enable_snapshots node['icinga2repo']['enable_snapshots']
end
