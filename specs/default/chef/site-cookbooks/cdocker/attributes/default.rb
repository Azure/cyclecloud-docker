# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
default['docker']['images'] = []

# Docker Registry login (TODO: NAME should be a Hash so we can allow multiple registry logins) 
default['docker']['registry']['name'] = nil
default['docker']['registry']['url'] = nil
default['docker']['registry']['username'] = nil
default['docker']['registry']['password'] = nil
default['docker']['registry']['email'] = nil
