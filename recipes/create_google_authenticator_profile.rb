Chef::Resource.include UserName
template 'create /etc/profile.d/google-authenticator.sh' do
  path '/etc/profile.d/google-authenticator.sh'
  source 'google-authenticator.sh.erb'
  variables user_names: user_names
end
