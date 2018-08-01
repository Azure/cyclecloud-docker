#
# Cookbook:: chef-yum-docker
# Recipe:: default
#
# Copyright:: 2016-2017, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

%w(
  docker-stable
  docker-edge
  docker-test
).each do |repo|
  yum_repository repo do
    node['yum'][repo].each do |config, value|
      send(config.to_sym, value) unless value.nil? || config == 'managed'
    end
  end if node['yum'][repo]['managed']
end
