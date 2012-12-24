set :stages, %w[local]
set :default_stage, 'local'
require 'capistrano/ext/multistage'

set :application, "Symfony2 base"
set :repository,  "https://github.com/lepermessiah57/capistrano-symfony.git"
set :branch, "master"

set :scm, :git
set :deploy_via, :remote_cache
set :use_sudo, false
ssh_options[:forward_agent] = true

set :copy_exclude, ["*.sh", ".git*", "config/deploy*", "Capfile", "Tests", "README"]

namespace :vendors do
  desc "install composer dependencies"
  task :update do 
      run "sh -c 'cd #{release_path} && php composer.phar install'"
  end

end

after "deploy:finalize_update", "vendors:update"

