name 'icinga2repo'
maintainer 'Virender Khatri'
maintainer_email 'vir.khatri@gmail.com'
license 'Apache-2.0'
description 'Installs/Configures Icinga2 Packages Repository'
long_description 'Installs/Configures Icinga2 Packages Repository'
version '1.0.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

issues_url 'https://github.com/Icinga/chef-icinga2repo/issues' if respond_to?(:issues_url)
source_url 'https://github.com/Icinga/chef-icinga2repo' if respond_to?(:source_url)

depends 'apt', '>= 5.0.1'
depends 'yum', '>= 4.1.0'
depends 'yum-epel', '>= 2.1.1'

%w[redhat centos amazon ubuntu debian raspbian].each do |os|
  supports os
end
