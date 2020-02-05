require 'chefspec_helper'

describe 'swiagent::remove_swiagent' do
  let(:chef_run) do
    chef_run = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04', step_into: ['swiagent'])
    chef_run.converge(described_recipe)
  end

  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end

  it 'removes apt repository for SolarWinds' do
    expect(chef_run).to remove_apt_repository('solarwinds')
  end

  it 'removes a package called swiagent' do
    expect(chef_run).to remove_package('swiagent')
      .with(name: 'swiagent')
  end
end
