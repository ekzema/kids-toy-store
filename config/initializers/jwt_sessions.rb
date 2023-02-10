JWTSessions.encryption_key = ENV['SECRET_KEY_BASE']
JWTSessions.access_exp_time = 3024000 #5 weeks
JWTSessions.token_store = :redis, {
  redis_host: "redis",
  redis_port: "6379",
  redis_db_name: "0",
  token_prefix: "jwt_",
  pool_size: Integer(ENV.fetch("RAILS_MAX_THREADS", 5))
}
