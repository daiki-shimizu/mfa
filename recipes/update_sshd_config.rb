file 'backup /etc/ssh/sshd_config' do
  path '/etc/ssh/sshd_config.backup'
  content IO.read('/etc/ssh/sshd_config')
  not_if { File.exist?(path) }
end

execute 'clear the immutable and append only attributes of /etc/ssh/sshd_config' do
  command 'chattr -a -i /etc/ssh/sshd_config'
end

template 'update /etc/ssh/sshd_config' do
  path '/etc/ssh/sshd_config'
  source 'sshd_config.erb'
  mode '600'
  notifies :reload, 'service[reload sshd to update sshd_config]'
  variables user_names: user_names
end

service 'reload sshd to update sshd_config' do
  service_name 'sshd'
  supports reload: true
  action :nothing
end

execute 'set the immutable and append only attributes of /etc/ssh/sshd_config' do
  command 'chattr +a +i /etc/ssh/sshd_config'
end

