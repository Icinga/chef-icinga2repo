icinga2repo Cookbook
================

[![Cookbook](https://img.shields.io/github/tag/Icinga/chef-icinga2repo.svg)](https://github.com/Icinga/chef-icinga2repo) [![Build Status](https://travis-ci.org/Icinga/chef-icinga2repo.svg?branch=master)](https://travis-ci.org/Icinga/chef-icinga2repo)

This is a [Chef] cookbook to manage [Icinga2] YUM/APT [Repository].


>> For Production environment, always prefer the [most recent release](https://supermarket.chef.io/cookbooks/icinga2repo).


## Most Recent Release

```ruby
cookbook 'icinga2repo', '~> 1.0.0'
```


## From Git

```ruby
cookbook 'icinga2repo', github: 'Icinga/chef-icinga2repo',  tag: 'v1.0.0'
```


## Repository

```
https://github.com/Icinga/icinga2repo
```


## Supported OS

- Amazon Linux
- CentOS
- Ubuntu
- Debian


## Supported Chef

- Chef 12
- Chef 13


## Cookbook Dependency

- apt
- yum


## Recipes

- `icinga2repo::apt` - configure icinga2 apt repository

- `icinga2repo::yum` - configure icinga2 yum repository

- `icinga2repo::default` - configure platform specific icinga2 repository


## YUM Repository Attributes

* `default['icinga2repo']['release']['yum']['description']` (default: `icinga2-release`): yum repository attribute

* `default['icinga2repo']['release']['yum']['gpgcheck']` (default: `true`): yum repository attribute

* `default['icinga2repo']['release']['yum']['enabled']` (default: `true`): yum repository attribute

* `default['icinga2repo']['release']['yum']['baseurl']` (default: `calculated`): yum repository attribute

* `default['icinga2repo']['release']['yum']['gpgkey']` (default: `http://packages.icinga.com/icinga.key`): yum repository attribute

* `default['icinga2repo']['release']['yum']['mirrorlist']` (default: `nil`): yum repository attribute

* `default['icinga2repo']['release']['yum']['metadata_expire']` (default: `3h`): yum repository attribute

* `default['icinga2repo']['release']['yum']['action']` (default: `:create`): yum repository attribute

* `default['icinga2repo']['snapshot']['yum']['description']` (default: `icinga2-release`): yum repository attribute

* `default['icinga2repo']['snapshot']['yum']['gpgcheck']` (default: `true`): yum repository attribute

* `default['icinga2repo']['snapshot']['yum']['enabled']` (default: `true`): yum repository attribute

* `default['icinga2repo']['snapshot']['yum']['baseurl']` (default: `calculated`): yum repository attribute

* `default['icinga2repo']['snapshot']['yum']['gpgkey']` (default: `http://packages.icinga.com/icinga.key`): yum repository attribute

* `default['icinga2repo']['snapshot']['yum']['mirrorlist']` (default: `nil`): yum repository attribute

* `default['icinga2repo']['snapshot']['yum']['metadata_expire']` (default: `3h`): yum repository attribute

* `default['icinga2repo']['snapshot']['yum']['action']` (default: `:create`): yum repository attribute


## APT Repository Attributes

* `default['icinga2repo']['release']['apt']['description']` (default: `icinga2-release`): apt repository attribute

* `default['icinga2repo']['release']['apt']['components']` (default: `['main']`): apt repository attribute

* `default['icinga2repo']['release']['apt']['uri']` (default: `calculated`): apt repository attribute

* `default['icinga2repo']['release']['apt']['key']` (default: `http://packages.icinga.com/icinga.key`): apt repository attribute

* `default['icinga2repo']['release']['apt']['keyserver']` (default: `keyserver.ubuntu.com`): apt repository attribute

* `default['icinga2repo']['release']['apt']['distribution']` (default: `calculated`): apt repository attribute

* `default['icinga2repo']['release']['apt']['action']` (default: `:add`): apt repository attribute

* `default['icinga2repo']['snapshot']['apt']['description']` (default: `icinga2-release`): apt repository attribute

* `default['icinga2repo']['snapshot']['apt']['components']` (default: `['main']`): apt repository attribute

* `default['icinga2repo']['snapshot']['apt']['uri']` (default: `calculated`): apt repository attribute

* `default['icinga2repo']['snapshot']['apt']['key']` (default: `http://packages.icinga.com/icinga.key`): apt repository attribute

* `default['icinga2repo']['snapshot']['apt']['keyserver']` (default: `keyserver.ubuntu.com`): apt repository attribute

* `default['icinga2repo']['snapshot']['apt']['distribution']` (default: `calculated`): apt repository attribute

* `default['icinga2repo']['snapshot']['apt']['action']` (default: `:add`): apt repository attribute


## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests (`rake & rake knife`), ensuring they all pass
6. Write new resource/attribute description to `README.md`
7. Write description about changes to PR
8. Submit a Pull Request using Github


## Copyright & License

Authors:: Virender Khatri and [Contributors]

<pre>
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
</pre>


[Chef]: https://www.chef.io/
[Icinga2]: https://www.icinga.com/
[Repository]: https://packages.icinga.com/
[Contributors]: https://github.com/Icinga/chef-icinga2repo/graphs/contributors
