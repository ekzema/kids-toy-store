require 'dotenv/load'

set :application, ENV['APP_NAME']
set :rails_env,   'production'
set :repo_url,    ENV['DEPLOY_REPO']
# set :branch,      'capistrano'
set :user,        ENV['DEPLOY_USER']
set :deploy_to,   "/home/#{fetch(:user)}/sites/#{fetch(:application)}"

server ENV['DEPLOY_SERVER'],
       user: fetch(:user),
       # port: "2222",
       roles: %w{web app db},
       primary: true,
       ssh_options: {
         user: "deploy",
         # keys: %w(/home/user_name/.ssh/id_rsa),
         forward_agent: false,
         auth_methods: %w(publickey password)
         # password: "please use keys"
       }


