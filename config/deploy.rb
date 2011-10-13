# -*- encoding : utf-8 -*-
require 'capistrano/ext/multistage'

# ==============================================================================
# Application Settings
# ==============================================================================

set :application,     "ticketer"
set :user,            "spree"
set :group,           "www-data"
set :repository,      "git@github.com:darkside/ticketer.git"
set :branch,          "origin/master"
set :deploy_to,       "/var/www/apps/#{application}"
set :rvm_ruby_string, "ree"

set :stages,        %w(production staging)
set :default_stage, "staging"


# ==============================================================================
# Server Settings
# ==============================================================================

set :app_name, application
set :web_server, :nginx
set :app_server, :unicorn

set :application_port, 80

set :unicorn_workers, 2

set :database,   :postgresql
set :monitorer,  nil

set :sockets_path, "#{shared_path}/pids"
set :shared_dirs, %w(config assets backup bundle pids tmp log)
set :nginx_path_prefix, "/usr/local/nginx"

# ==============================================================================
# Symlinks
# ==============================================================================

set :normal_symlinks, %w(log tmp config/unicorn.rb config/database.yml config/app.god)

set :weird_symlinks, { 'bundle' => 'vendor/bundle',
'assets' => 'public/assets',
'pids' => 'tmp/pids' }


# Finally, require the capistrano recipes.
require 'capistrano_recipes'

before "deploy:restart" do
  run  "rm -f #{current_path}/public/stylesheets/all.css"
  sudo "chown #{user}:#{group} #{deploy_to} -R"
end

