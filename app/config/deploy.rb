set :application, "symfony"
set :domain,      "localhost"
set :deploy_to,   "/var/www/symfony2/"
set :app_path,    "app"
 
set :user, "dagger57"
 
set :repository, "https://github.com/lepermessiah57/capistrano-symfony.git"
set :scm,         :git
#set :deploy_via,  :copy
 
set :model_manager, "doctrine"
 
role :web,        domain                         # Your HTTP server, Apache/etc
role :app,        domain                         # This may be the same as your `Web` server
role :db,         domain, :primary => true       # This is where Symfony2 migrations will run
 
set  :use_sudo, false
set  :keep_releases,  3
 
#set :shared_files,      ["app/config/parameters.yml"]
set :shared_children,   [web_path + "/uploads"]
 
set :use_composer, true
set :update_vendors, true
set :vendors_mode, :install
 
set :writable_dirs,     ["app/cache", "app/logs"]
set :webserver_user,    "apache"
set :permission_method, :acl
 
# Ensure that our logs + cache get the proper permissions during deploy.
before "deploy:restart", "deploy:set_permissions"
 
# Be more verbose by uncommenting the following line
logger.level = Logger::MAX_LEVEL


#set :application, "testing capifony"
#set :domain,      "localhost"
#set :deploy_to,   "/var/www/symfony2/"
#set :app_path,    "app"

#set :repository,  "https://github.com/lepermessiah57/capistrano-symfony.git"
#set :scm,         :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `subversion`, `mercurial`, `perforce`, or `none`

#set :shared_children,     [app_path + "/logs", web_path + "/uploads"]
#set :use_composer, true

#set :model_manager, "doctrine"
# Or: `propel`

#role :web,        domain                         # Your HTTP server, Apache/etc
#role :app,        domain                         # This may be the same as your `Web` server
#role :db,         domain, :primary => true       # This is where Symfony2 migrations will run

#set  :keep_releases,  3

# Be more verbose by uncommenting the following line
# logger.level = Logger::MAX_LEVEL
