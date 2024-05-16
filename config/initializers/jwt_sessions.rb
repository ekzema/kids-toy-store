JWTSessions.encryption_key = ENV['SECRET_KEY_BASE']
JWTSessions.access_exp_time = 3024000 #5 weeks

unless Rails.env.test?
  options = {
    redis_port: "6379",
    redis_db_name: Rails.env.production? ? "1" : "0",
    token_prefix: "jwt_",
    pool_size: Integer(ENV.fetch("RAILS_MAX_THREADS", 5))
  }

  # For docker
  options.merge!({ redis_host: "redis" }) if Rails.env.development?

  JWTSessions.token_store = :redis, options
end
