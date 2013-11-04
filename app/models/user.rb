class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      if auth["provider"] == "twitter"
        user.name = auth["info"]["nickname"]
      else
        # just try something if we aren't sure
        user.name = auth["user_info"]["name"]
      end
    end
  end
end
