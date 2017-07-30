CACHE = Chef::Config['file_cache_path']

cookbook_file install_script = File.join(CACHE, 'install.sh') do
  source 'install.sh'
  mode '755'
end

execute 'install mfa' do
  cwd CACHE
  command install_script
end
