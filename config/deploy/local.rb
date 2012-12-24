set :site, "localhost"
set :deploy_to,   "/var/www/symfony"

role :app, site
role :web, site

