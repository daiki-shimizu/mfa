Chef::Recipe.include UserName
user_names.each do |user_name|
  file "delete a secret key for #{user_name}" do
    path "/home/#{user_name}/.google_authenticator"
    action :delete
  end
end
