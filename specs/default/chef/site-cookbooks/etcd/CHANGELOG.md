# etcd Cookbook CHANGELOG

This file is used to list changes made in each version of the etcd cookbook.

## 5.1.0 (2017-09-11)

- Be less specific in the service resources so we can support any platform that is systemd, upstart or sys-v 
- Add that we support opensuse leap to the metadata / readme

## 5.0.0 (2017-09-05)

### Breaking Changes

- This cookbook has been refactored to work with etcd 3.X and now defaults to installing 3.2.6\. 2.x will not work as many new configuration properties have been added to etcd. If you need support for etcd 2.x you should pin the 4.X release of this cookbook.
- This cookbook now longer requires compat_resource and also utilizes the systemd_unit resource in Chef. Due to this the cookbook now requires Chef 12.11 or later.
- The execute provider for the etcd_service has been removed as Chef should not be used as an init system. There is now fully functional sys-v, upstart, and systemd support, which are preferred alternatives.

### Other Changes

- Listening ports in examples, tests, and resources have been updated for the new ports used by etcd
- Integration testing has been updated to InSpec
- The default path to the data dir is now an absolute path to resolve some previous issues
- All Chef 14 deprecation warnings have been resolved
- Remove the only_if on the service start that could potentially prevent the service from starting
- Sync up the unit file with the upstream format recommended by the project
- Fix faulty logfile logic in the upstart / sys-v scripts that prevented these resources from ever working

## 4.1.0 (2017-08-20)

- Fixing some deprecation warnings

## 4.1.0 (2016-10-10)

- suse is systemd not sysv
- Require Chef 12.1+ and the latest compat_resource
- Define custom matchers helpers for Chefspec

## 4.0.0

- Install etcd 2.3.7 by default
- Install tar to ensure we can decompress the etcd package
- Replace testing of Ubuntu 15.10 with 16.04
- Fix testing in Test Kitchen using vagrant
- Add a Gemfile with testing dependencies
- Update the compat_resource dependency from 12.5 to 12.10 to bring in the latest fixes
- Add chef_version metadata to the metadata.rb file

## 3.2.5

- Added Redhat, Oracle Linux, and Scientific Linux to the metadata
- Fixed issues_url and source_url in the metadata to point to the correct URL
- Added license to the metadata
- Updated Rakefile so testing tasks match other Chef cookbooks
- Add maintainers files and Rake task to generate the markdown

## 3.2.4

- Added support for Scientific / Oracle Linux 6.X
- Fixed readme badges
- Added a chefignore file
- Add contributing and testing docs
- Removed Ruby 2.2 via RVM install from the Travis CI runs

## 3.2.3

- Retrying key operations

## 3.2.2

- Using converge_if_changed in :set action

## 3.2.1

- Adding etcd_key resource
- Removing unused property previous_state
- Adding desired_state: false to various properties

## 3.2.0

- Adding etcd_key resource

## 3.1.6

- Fix redirecting stderr to stdout in upstart manaager

## 3.1.5

- Fix timeout pattern in systemd-wait-ready

## 3.1.4

- Fixing up docker service manager tests

## 3.1.3

- Fixing incorrectly named classes in service managers

## 3.1.2

- Fixing wait-ready script to use etcdctl_cmd

## 3.1.1

- Adding docker to etcd_service

## 3.1.0

- Supporting run_user on service manager resources

## 3.0.0

- New major version, non-backwards compatible with 2.x.x
- Rewritten as Custom Resources
- Defaulting to etcd version 2.2.2

## 2.2.2

- update to etcd 0.4.6
- adds debian support

## 2.2.1

- update to etcd 0.4.5
- Add centos 7 support
- Support centos cloud images without tar
- Dry out compile time recipe
- Move to berks3

## 2.2.0

- update to etcd 0.4.2
- Removed node[:etcd][:local] No longer needed in new etcd. Etcd will default bind :4001 and :7001.
- The cookbook default is now to use node[:ipaddress] as the addr and peer_addr.
- add auto-respawn instruction in upstart config file
- Fix Gem deps in the ci build

## 2.1.3

- add peer and peer_addr support / attributes
- add name attribute and computation
- fixup cmdline argument computation
- ensure cluster members are always sorted
- fix spec tests

## 2.1.2

- fix bug in cluster recipe where Resolv was spelled wrong
- fix kitchen test on cluster to pickup this issue.
- add basic chefspec as well to ensure this sort of issue doesn't occur
- fix bug with name attribute methods
- fix searching for wrong recipe when using cluster recipe

## 2.1.1

- update to etcd 0.3.0
- Add support for new discovery mode
- refactor common functions into library methods
- Add specs
- Use rubocop to replace tailor/cane
- Fixup testing (add travis integration)

## 2.0.0

- update to etcd 0.2.0
- remove `name_switch` attribute. It was marked for deprication in 1.3
- enable snapshotting by default
- add optional local listener
- support chef-solo
- Add support of explicitely specifying a cluster's nodes

## 1.3.5

- silence foodcritic by accessing attributes in a consistent manner,
- trigger a restart when etcd conf is updated
- include git if source install
- metadata depends on git recipe
- Update Documentation
- Update contributors

## 1.3.4

- fix compile_time to use the right tarball path

## 1.3.3

- Bump to etcd 1.2
- Added source install recipe

## 1.3.1

- default binding to node[:ipaddress]

## 1.2.4

- update to etcd 0.1.1 release
- add compile_time recipe that does the whole bit in chef compile time

## 1.2.3

- hotfix to add missing `node[:etcd][:env_scope]` attribute
- bugfix: use `node[:fqdn]` instead of hostname when matching local machine name

## 1.2.2

- add cluster recipe for setting up clusters of etcd nodes
- re-add seed-node attribute

## 1.2.1

- fix the startup args so it is easier to specify custom args
- supports release version and current master on git
- add in tests for both release and git versions of etcd

## 1.1.1

- Make everything work with release 0.1.0 of etcd
- fixup some syntax issues

## 1.1.0

- move binary install to using coreos/etcd releases from github
- for now the install locattion is fixed to /usr/local and links in /usr/local/bin
- Use ark for managing tarballs
- move bats tests to using etcdctl instead of curl
