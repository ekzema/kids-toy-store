# config valid for current version and patch releases of Capistrano
lock "~> 3.18.0"

set :application, "kids-toy-store"
set :repo_url, "git@github.com:ekzema/kids-toy-store.git"
set :branch, "capistrano"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/sites/kids-toy-store"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, '.env'

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor", "storage", "public/packs", "node_modules"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5
set :rails_env, 'production'
set :rbenv_ruby, '3.1.2'
set :nvm_node, 'v16.20.2'
set :nvm_type, :user
set :nvm_map_bins, %w{node npm yarn rake}
set :rbenv_map_bins, %w{rake gem bundle ruby rails}

before 'deploy:migrate', 'database:create'
# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
