require 'rvm/capistrano'
require 'bundler/capistrano'
set   :rvm_type,        :system
set   :rvm_path,        '/usr/local/rvm'
#set   :rvm_ruby_string, '1.9.3-p392'

# Main configuration.
server 'VaporLounge.PierreQR.fr', :app, :web, :db, primary: true
set     :application,         'Pierre qui Roule - Cadavre Esquisse'
set     :keep_releases,       3

# Servers details.
ssh_options[:port]            = '22'
ssh_options[:keys]            = %w('~/.ssh/HicksCorp@GMail.com')
ssh_options[:forward_agent]   = true
default_run_options[:pty]     = true
set   :deploy_to,             '/home/system/passenger/sites/pierreqr.fr/restauranteur'
set   :deploy_via,            :remote_cache
set   :user,                  'passenger'
set   :use_sudo,              false

# Repository configuration.
set   :scm,                   :git
set   :scm_username,          'passenger'
set   :repository,            'git@VaporLounge.PierreQR.fr:PQR/Restauranteur/RailsApp.git'
set   :branch,                'master'
set   :git_enable_submodules, 1

# Tasks.
namespace :deploy do
  desc 'Restart Application'
  task :restart, roles: :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Reload Database with Seed Data"
  task :seed do
    run "cd #{release_path} && bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
end

# Hook to automatically trust .rvmrc.
namespace :rvm do
  desc 'Trust RVM RC'
  task :trust_rvmrc do
    run "rvm rvmrc trust #{current_release}"
  end
end

#before  'deploy',               'deploy:setup'
after   'deploy:update_code',   'rvm:trust_rvmrc'
after   'rvm:trust_rvmrc',      'deploy:migrate'
after   'deploy:migrate',       'deploy:seed'
after   'deploy:restart',       'deploy:cleanup'
