
OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Settings.auth.twitter_key, Settings.auth.twitter_secret
  provider :github, Settings.auth.github_key, Settings.auth.github_secret
end