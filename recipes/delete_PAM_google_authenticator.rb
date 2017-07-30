file 'delete /etc/pam.d/google-auth' do
  path '/etc/pam.d/google-auth'
  action :delete
end
