# This provides helper methods to get an array for user names.
module UserName
  def user_names
    user_names_from_attribute + user_names_from_file +
      user_names_from_environment_variable
  end

  def default_file
    '/root/.goole_authenticator_user_names'
  end

  def user_names_from_attribute
    case node['mfa']['user_names']
    when Array then
      node['mfa']['user_names']
    when String then
      node['mfa']['user_names'].split
    else
      []
    end
  end

 def file_name
    if node['mfa']['user_names_file'] &&
       File.exist?(node['mfa']['user_names_file'])
      return node['mfa']['user_names_file']
    end
    default_file
  end

  def user_names_from_file
    if File.exist?(file_name)
      File.open(file_name).read.split.grep(/^[a-z_][a-z0-9_]{0,31}/)
    else
      []
    end
  end

  def user_names_from_environment_variable
    (ENV['GOOGLE_AUTHENTICATOR_USER_NAMES'] || '').split
  end
end
