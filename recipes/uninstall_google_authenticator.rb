CACHE = Chef::Config['file_cache_path']

cookbook_file uninstall_script = File.join(CACHE, 'uninstall.sh') do
  source 'uninstall.sh'
  mode '755'
end

execute 'uninstall mfa' do
  cwd CACHE
  command uninstall_script
end
