base_url = case node['platform']
           when 'fedora'
             "https://download.docker.com/linux/fedora/#{node['platform_version'].to_i}/x86_64"
           else
             "https://download.docker.com/linux/centos/#{node['platform_version'].to_i}/x86_64"
           end

gpg_key = case node['platform']
          when 'fedora'
            'https://download.docker.com/linux/fedora/gpg'
          else
            'https://download.docker.com/linux/centos/gpg'
          end

default['yum']['docker-stable']['baseurl'] = "#{base_url}/stable"
default['yum']['docker-stable']['description'] = 'Docker Stable Respository'
default['yum']['docker-stable']['gpgkey'] = gpg_key
default['yum']['docker-stable']['gpgcheck'] = true
default['yum']['docker-stable']['enabled'] = true
default['yum']['docker-stable']['managed'] = true

default['yum']['docker-edge']['baseurl'] = "#{base_url}/edge"
default['yum']['docker-edge']['description'] = 'Docker Edge Respository'
default['yum']['docker-edge']['gpgkey'] = gpg_key
default['yum']['docker-edge']['gpgcheck'] = true
default['yum']['docker-edge']['enabled'] = false
default['yum']['docker-edge']['managed'] = true

default['yum']['docker-test']['baseurl'] = "#{base_url}/test"
default['yum']['docker-test']['description'] = 'Docker Test Respository'
default['yum']['docker-test']['gpgkey'] = gpg_key
default['yum']['docker-test']['gpgcheck'] = true
default['yum']['docker-test']['enabled'] = false
default['yum']['docker-test']['managed'] = true
