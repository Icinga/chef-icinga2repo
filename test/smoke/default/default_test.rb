# # encoding: utf-8

# Inspec test for recipe icinga2repo::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

if os.name == 'redhat' || os.name == 'centos'
  describe file('/etc/yum.repos.d/icinga2-release.repo') do
    its('content') { should match %r{http://packages.icinga.com/epel/\$releasever/release} }
  end

  describe file('/etc/yum.repos.d/icinga2-snapshot.repo') do
    its('content') { should match %r{http://packages.icinga.com/epel/\$releasever/snapshot} }
  end
elsif os.name == 'amazon'
  describe file('/etc/yum.repos.d/icinga2-release.repo') do
    its('content') { should match %r{http://packages.icinga.com/epel/6/release} }
  end

  describe file('/etc/yum.repos.d/icinga2-snapshot.repo') do
    its('content') { should match %r{http://packages.icinga.com/epel/6/snapshot} }
  end
elsif os.name == 'fedora'
  describe file('/etc/yum.repos.d/icinga2-release.repo') do
    its('content') { should match %r{http://packages.icinga.com/fedora/\$releasever/release} }
  end

  describe file('/etc/yum.repos.d/icinga2-snapshot.repo') do
    its('content') { should match %r{http://packages.icinga.com/fedora/\$releasever/snapshot} }
  end
elsif os.name == 'ubuntu'
  describe file('/etc/apt/sources.list.d/icinga2-release.list') do
    its('content') { should match %r{http://packages.icinga.com/ubuntu} }
  end

  describe file('/etc/apt/sources.list.d/icinga2-snapshot.list') do
    it { should_not exist }
  end
elsif os.name == 'debian'
  describe file('/etc/apt/sources.list.d/icinga2-release.list') do
    its('content') { should match %r{http://packages.icinga.com/debian} }
  end

  describe file('/etc/apt/sources.list.d/icinga2-snapshot.list') do
    it { should_not exist }
  end
elsif os.name == 'raspbian'
  describe file('/etc/apt/sources.list.d/icinga2-release.list') do
    its('content') { should match %r{http://packages.icinga.com/debian} }
  end

  describe file('/etc/apt/sources.list.d/icinga2-snapshot.list') do
    it { should_not exist }
  end
end

describe package('icinga2') do
  it { should be_installed }
end

describe package('icinga2-common') do
  it { should be_installed }
end

describe package('icinga2-bin') do
  it { should be_installed }
end
