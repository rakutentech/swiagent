resource_name :swiagent

property :fqdn, String, required: true
property :port, Integer, default: 17778
property :ssl, [ true, false ], required: true, default: true
property :username, String, desired_state: false, identity: true
property :password, String, desired_state: false, sensitive: true


action :install do
  url = "http#{ 's' if new_resource.ssl }://#{new_resource.fqdn}"

  case node['platform']
  when 'ubuntu'
    apt_repository 'solarwinds' do
      components   ['swiagent']
      distribution 'ubuntu-14'
      trusted      true
      uri          "#{url}/Orion/AgentManagement/LinuxPackageRepository.ashx?path="
    end
  when 'centos'
    yum_repository 'solarwinds' do
      baseurl "#{url}/Orion/AgentManagement/LinuxPackageRepository.ashx?path=/dists/centos-5/$basearch"
      description 'SolarWinds Agent'
      enabled true
      gpgcheck false
    end
  end

  package 'swiagent'

  unless new_resource.fqdn.nil? || new_resource.password.nil?
    bash 'setup swiagent' do
      code "echo $'2\n#{new_resource.fqdn}\n3\n''#{new_resource.port}'$'\n4\n''#{new_resource.username}'$'\n5\n''#{new_resource.password}'$'\n7\n\n' | service swiagentd init"
      sensitive true
      not_if 'ps aux | grep swiagent | grep -v grep'
    end

    service 'swiagentd' do
      action [:start, :enable]
    end
  end
end

action :remove do
  package 'swiagent' do
    action :remove
  end

  case node['platform']
  when 'ubuntu'
    apt_repository 'solarwinds' do
      action :remove
    end
  when 'centos'
    yum_repository 'solarwinds' do
      action :delete
    end
  end
end
