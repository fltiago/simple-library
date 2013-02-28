Rails.application.config.middleware.use OmniAuth::Builder do
  provider :redu,  "consumer_id", "consumer_secret"
end
