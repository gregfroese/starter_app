class LdapController < ApplicationController
  authorize_resource :class => false
  skip_authorization_check

  def welcome
  end

  def login
    username = params[:username]
    password = params[:password]
    connection = Net::LDAP.new(:host => "10.10.20.13", :port => 389, :base => "DC=WESTERNFG,DC=CA", :auth => {:username => "westernfg\\#{username}", password: password, :method => :simple})
    if connection.bind
      config.logger.info "Devise Simple LDAP: bind successful"
      result = connection.search(filter: "sAMAccountName=#username}").try(:first)
      if !result
        config.logger.warn("Devise Simple LDAP: Could not find user '#{username}' by sAMAccountName. #{connection.get_operation_result.inspect}")
      end
    else
      config.logger.info("Devise Simple LDAP: failed to bind user '#{username}': #{connection.get_operation_result}")
      return nil
    end
    redirect_to root_path
  end
end
