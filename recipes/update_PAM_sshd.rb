file 'backup /etc/pam.d/sshd' do
  path '/etc/pam.d/sshd.backup'
  content IO.read('/etc/pam.d/sshd')
  not_if { File.exist?(path) }
end

cookbook_file 'create /etc/pam.d/sshd' do
  path '/etc/pam.d/sshd'
  source 'sshd'
end
