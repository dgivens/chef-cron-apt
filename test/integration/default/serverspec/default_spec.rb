require 'serverspec'

RSpec.configure do |c|
  c.before :all do
    c.path = '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
  end
end

describe package('cron-apt') do
  it { should be_installed }
end

describe file('/etc/cron.d/cron-apt') do
  it { should be_file }
  it { should contain '0 4 * * * root test -x /usr/sbin/cron-apt && ' \
                      '/usr/sbin/cron-apt &> /dev/null' }
end

describe command('/usr/sbin/cron-apt') do
  its(:exit_status) { should eq 0 }
end
