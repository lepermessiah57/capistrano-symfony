set :stages, %w[local]
set :default_stage, 'local'
require 'capistrano/ext/multistage'

set :application, "Symfony2 base"
set :repository,  "localhost:/home/dagger57/code/Symfony"
set :branch, "master"

set :scm, :git
set :deploy_via, :remote_cache
set :use_sudo, false
ssh_options[:forward_agent] = true

set :copy_exclude, ["*.sh", ".git*", "config/deploy*", "Capfile", "Tests", "README"]

