# frozen_string_literal: true

namespace :server do
  desc 'Start server'
  task :start do
    on roles(:app) do
      execute "sudo systemctl start #{fetch(:application)}.service"
    end
  end

  desc 'Stop server'
  task :stop do
    on roles(:app) do
      execute "sudo systemctl stop #{fetch(:application)}.service"
    end
  end

  desc 'Restart server'
  task :restart do
    on roles(:app) do
      execute "sudo systemctl restart #{fetch(:application)}.service"
    end
  end
end
