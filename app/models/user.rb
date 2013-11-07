class User < ActiveRecord::Base
  serialize :roles, Array
  has_many :projects
  has_many :created_stories, class_name: "Story", foreign_key: "user_id"
  has_many :comments

  has_many :assignments
  has_many :stories, through: :assignments
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      if auth["provider"] == "twitter"
        user.name = auth["info"]["nickname"]
      elsif auth["provider"] == "github"
        user.name = auth["info"]["nickname"]
      else
        # just try something if we aren't sure
        user.name = auth["user_info"]["name"]
      end
    end
  end

  Ability.roles.each do |role|
    define_method "#{role}_role?" do
      self.roles.include?(role.to_s)
    end
  end
end
