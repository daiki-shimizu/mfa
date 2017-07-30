%w(autoconf automake libtool git pam-devel).each do |p|
  package "remove #{p}" do
    package_name p
    action :remove
  end
end
