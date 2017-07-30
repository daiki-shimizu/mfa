file 'restore /etc/pam.d/sshd' do
  path '/etc/pam.d/sshd'
  content IO.read('/etc/pam.d/sshd.backup')
end
