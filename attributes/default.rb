# frozen_string_literal: true

# Whether to enable the snapshots repository or not
default['icinga2repo']['enable_snapshots'] = false

case node['platform_family']
when 'fedora', 'rhel', 'amazon'
  yum_baseurl = value_for_platform(
    'fedora' => { 'default' => 'http://packages.icinga.com/fedora/$releasever' },
    %w[centos redhat] => { 'default' => 'http://packages.icinga.com/epel/$releasever' },
    'amazon' => { 'default' => 'http://packages.icinga.com/epel/6' }
  )

  default['icinga2repo']['release']['yum']['description'] = 'icinga2-release'
  default['icinga2repo']['release']['yum']['gpgcheck'] = true
  default['icinga2repo']['release']['yum']['enabled'] = true
  default['icinga2repo']['release']['yum']['gpgkey'] = 'http://packages.icinga.com/icinga.key'
  default['icinga2repo']['release']['yum']['baseurl'] = "#{yum_baseurl}/release/"
  default['icinga2repo']['release']['yum']['mirrorlist'] = nil
  default['icinga2repo']['release']['yum']['metadata_expire'] = '10h'

  default['icinga2repo']['snapshot']['yum']['description'] = 'icinga2-snapshot'
  default['icinga2repo']['snapshot']['yum']['gpgcheck'] = true
  default['icinga2repo']['snapshot']['yum']['enabled'] = false
  default['icinga2repo']['snapshot']['yum']['gpgkey'] = 'http://packages.icinga.com/icinga.key'
  default['icinga2repo']['snapshot']['yum']['baseurl'] = "#{yum_baseurl}/snapshot/"
  default['icinga2repo']['snapshot']['yum']['mirrorlist'] = nil
  default['icinga2repo']['snapshot']['yum']['metadata_expire'] = '10h'

when 'raspbian', 'debian'
  apt_baseurl = value_for_platform(
    'ubuntu' => { 'default' => 'http://packages.icinga.com/ubuntu' },
    'debian' => { 'default' => 'http://packages.icinga.com/debian' }
  )

  default['icinga2repo']['release']['apt']['repo'] = 'icinga2-release'
  default['icinga2repo']['release']['apt']['keyserver'] = 'keyserver.ubuntu.com'
  default['icinga2repo']['release']['apt']['key'] = 'http://packages.icinga.com/icinga.key'
  default['icinga2repo']['release']['apt']['components'] = %w[main]
  default['icinga2repo']['release']['apt']['deb_src'] = false
  default['icinga2repo']['release']['apt']['uri'] = apt_baseurl
  default['icinga2repo']['release']['apt']['distribution'] = 'icinga-' + node['lsb']['codename'].to_s

  default['icinga2repo']['snapshot']['apt']['repo'] = 'icinga2-snapshot'
  default['icinga2repo']['snapshot']['apt']['keyserver'] = 'keyserver.ubuntu.com'
  default['icinga2repo']['snapshot']['apt']['key'] = 'http://packages.icinga.com/icinga.key'
  default['icinga2repo']['snapshot']['apt']['components'] = %w[main]
  default['icinga2repo']['snapshot']['apt']['deb_src'] = false
  default['icinga2repo']['snapshot']['apt']['uri'] = "#{apt_baseurl}-snapshots"
  default['icinga2repo']['snapshot']['apt']['distribution'] = 'icinga-' + node['lsb']['codename'].to_s + '-snapshots'
else
  default['icinga2repo']['release']['apt'] = {}
  default['icinga2repo']['snapshot']['apt']['repo'] = {}
end
