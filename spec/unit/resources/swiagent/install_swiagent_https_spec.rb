require 'chefspec_helper'

describe 'solarwinds::install_swiagent_https' do
  let(:chef_run) do
    chef_run = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04', step_into: ['swiagent'])
    chef_run.converge(described_recipe)
  end

  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end

  it 'adds apt repository for SolarWinds' do
    expect(chef_run).to add_apt_repository('solarwinds')
      .with(name: 'solarwinds')
      .with(distribution: 'ubuntu-14')
      .with(trusted: true)
      .with(uri: 'https://orion.solarwinds.com/Orion/AgentManagement/LinuxPackageRepository.ashx?path=')
  end

  it 'installs a package called swiagent' do
    expect(chef_run).to install_package('swiagent')
      .with(name: 'swiagent')
  end
end
