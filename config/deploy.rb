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

set :stages,        %w(production)
set :default_stage, "production"


# ==============================================================================
# Server Settings
# ==============================================================================

set :app_name, application
set :web_server, :nginx
set :app_server, :unicorn

set :application_port, 80

set :unicorn_workers, 2

set :database,   :postgresql
set :monitorer,  :god
set :rails_env,  'production'
set :sockets_path, "#{shared_path}/pids"
set :shared_dirs, %w(config assets backup bundle pids tmp log)
set :nginx_path_prefix, "/usr/local/nginx"

# God overrides
set :god_conf_local,        "doc/god/god.conf"     # god shared config and helpers
set :bin_god,               "bootup_god"           # god rvm wrapper
set :god_local_config,      "doc/app.god.erb"      # god watches
set :god_init_local,        "doc/god/god.init.erb" # god init script

# ==============================================================================
# Symlinks
# ==============================================================================

set :normal_symlinks, %w(log tmp config/unicorn.rb config/database.yml config/app.god)

set :weird_symlinks, { 'bundle' => 'vendor/bundle',
'assets' => 'public/assets',
'pids' => 'tmp/pids' }


# Finally, require the capistrano recipes.
require 'capistrano_recipes'

# Update ownership if needed, run compass and barista.
after "deploy:update", :roles => :app do
  run "#{sudo} chown #{user}:#{group} #{current_path} -R"
  run "cd #{current_path} && bundle exec rake barista:brew RAILS_ENV=#{environment}"
  run "cd #{current_path} && bundle exec compass compile --output-style compressed --force"
end

