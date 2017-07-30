Chef::Recipe.include(UserName)
Chef::Resource.include(UserName)

log user_names

log "resource" do
  message user_names.join(' ')
  level :warn
end
