execute 'clear the immutable and append only attributes of /etc/ssh/sshd_config' do
  command 'chattr -a -i /etc/ssh/sshd_config'
end

file 'restore /etc/ssh/sshd_config' do
  path '/etc/ssh/sshd_config'
  content IO.read('/etc/ssh/sshd_config.backup')
  mode '600'
  notifies :reload, 'service[reload sshd to restore sshd_config]'
end

service 'reload sshd to restore sshd_config' do
  service_name 'sshd'
  supports reload: true
  action :nothing
end

execute 'set the immutable and append only attributes of /etc/ssh/sshd_config' do
  command 'chattr +a +i /etc/ssh/sshd_config'
end

