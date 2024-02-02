# config valid for current version and patch releases of Capistrano
lock "~> 3.18.0"

append :linked_files, '.env'
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor", "storage", "public/packs", 'public/uploads', "node_modules"

set :keep_releases, 5
set :nvm_type, :user
set :nvm_map_bins, %w{node npm yarn rake}
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_ruby, '3.1.2'
set :nvm_node, 'v16.20.2'

before 'deploy:migrate', 'database:create'
after 'deploy', 'server:restart'
