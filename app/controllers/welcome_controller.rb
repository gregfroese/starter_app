class WelcomeController < ApplicationController
  skip_authorization_check 
  # authorize_resource :class => false

  def index
    @projects = Project.all
  end

  def unauthorized
  end
end
