class SessionsController < ApplicationController
  def create
    # raise request.env["omniauth.auth"].to_yaml
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, notice: 'Successfully signed in.'
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
  def failure
    # flash[:auth_failure] = params[:message]
    redirect_to root_path, :alert => params[:message]
  end
  def ldap_login
    username = params[:username]
    password = params[:password]
    connection = Net::LDAP.new(:host => "10.10.20.13", :port => 389, :base => "DC=WESTERNFG,DC=CA", :auth => {:username => "westernfg\\#{username}", password: password, :method => :simple})
    if connection.bind
      config.logger.info "Devise Simple LDAP: bind successful"
      result = connection.search(filter: "sAMAccountName=#{username}").try(:first)
      if !result
        config.logger.warn("Devise Simple LDAP: Could not find user '#{username}' by sAMAccountName. #{connection.get_operation_result.inspect}")
        redirect_to root_path, :alert => "Failed to login"
        return nil
      end

      user = User.find_by_provider_and_name("ldap", username) || User.create(provider: "ldap", uid: username, name: username )
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Successfully signed in.' 
    else
      config.logger.info("Devise Simple LDAP: failed to bind user '#{username}': #{connection.get_operation_result}")
      redirect_to root_url, alert: "Failed to login" 
    end    
  end
end
