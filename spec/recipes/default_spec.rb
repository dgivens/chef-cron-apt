require_relative '../spec_helper'

describe 'cron-apt::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'includes recipe[cron::default]' do
    expect(chef_run).to include_recipe('cron::default')
  end

  it 'installs package[cron-apt]' do
    expect(chef_run).to install_package('cron-apt')
  end

  it 'deletes file[/etc/cron-apt/action.d/3-download' do
    expect(chef_run).to delete_file('/etc/cron-apt/action.d/3-download')
  end

  it 'creates cookbook_file[/etc/cron-apt/action.d/0-update' do
    expect(chef_run).to create_cookbook_file('/etc/cron-apt/action.d/0-update')
  end

  it 'creates cookbook_file[/etc/cron-apt/action.d/5-upgrade' do
    expect(chef_run).to create_cookbook_file('/etc/cron-apt/action.d/5-upgrade')
  end

  it 'creates cookbook_file[/etc/cron-apt/action.d/6-autoremove' do
    expect(chef_run).to create_cookbook_file('/etc/cron-apt/action.d/' \
                                             '6-autoremove')
  end

  it 'creates cron_d[cron-apt]' do
    expect(chef_run).to create_cron_d('cron-apt')
  end
end
