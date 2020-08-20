#
# Cookbook:: swiagent
# Recipe:: install_swiagent
#
# Copyright:: 2017, The Authors, All Rights Reserved.

swiagent 'install swiagent' do
  fqdn 'orion.solarwinds.com'
  ssl false
end
