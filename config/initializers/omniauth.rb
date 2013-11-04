
OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'p4zMg4fklbPHObuvDMpb3g', 'AinZzD82JmpFVedyn8nbdDGT1XayMDxU4TtwNx4o1f8'
  provider :github, "f92e9ef96d4abd3d0184", "ed9915163890fe8bfeeb3bb93303182ae4f4013d"
  # provider :ldap,
  #           host: "10.10.20.13",
  #           port: 389,
  #           base: "DC=WESTERNFG,DC=CA",
  #           domain: "westernfg",
  #           method: "plain",
  #           allow_anonymous: true,
  #           uid: 'sAMAccountName'
            # :uid => 'UserPrincipalName',
            # :bind_dn => "anonymous"
end

# use OmniAuth::Strategies::LDAP, 
#     :title => "My LDAP", 
#     :host => '10.101.10.1',
#     :port => 389,
#     :method => :plain,
#     :base => 'dc=intridea, dc=com',
#     :uid => 'sAMAccountName',
#     :name_proc => Proc.new {|name| name.gsub(/@.*$/,'')}
#     :bind_dn => 'default_bind_dn'
#     :password => 'password'