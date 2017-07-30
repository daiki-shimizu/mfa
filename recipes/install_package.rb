%w(autoconf automake libtool git pam-devel).each do |p|
  package "install #{p}" do
    package_name p
  end
end
