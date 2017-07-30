cookbook_file 'create /etc/pam.d/google-auth' do
  path '/etc/pam.d/google-auth'
  source 'google-auth'
end
