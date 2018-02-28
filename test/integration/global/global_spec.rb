if os[:family] == 'freebsd'
  logrotate_conf = '/usr/local/etc/logrotate.conf'
  logrotate_dir = '/usr/local/etc/logrotate.d'
else
  logrotate_conf = '/etc/logrotate.conf'
  logrotate_dir = '/etc/logrotate.d'
end

describe package('logrotate') do
  it { should be_installed }
end

describe file(logrotate_conf) do
  it { should be_a_file }
  its('mode') { should cmp '0644' }
  its('content') { should include "include #{logrotate_dir}" }
end

describe file(logrotate_dir) do
  it { should be_a_directory }
  its('mode') { should cmp '0755' }
end
