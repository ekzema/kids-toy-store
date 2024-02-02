require 'dotenv/load'

set :application, ENV['APP_NAME']
set :rails_env,   'production'
set :repo_url,    'git@github.com:ekzema/kids-toy-store.git'
set :branch,      'capistrano'
set :user,        'deploy'
set :deploy_to,   "/home/#{fetch(:user)}/sites/#{fetch(:application)}"

server "172.17.0.1",
       user: fetch(:user),
       port: "2222",
       roles: %w{web app db},
       primary: true,
       ssh_options: {
         user: "deploy",
         # keys: %w(/home/user_name/.ssh/id_rsa),
         forward_agent: false,
         auth_methods: %w(publickey password)
         # password: "please use keys"
       }


