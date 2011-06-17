set :application, "adviseit"
set :domain, "ftp.fabianoalmeida.com"
set :repository, "git@github.com:fabianoalmeida/#{application}.git"
set :use_sudo, false
set :deploy_to, "/home/*VPS USER NAME*/*APP ABBREVIATION*"
set :scm, :git
set :scm_username, "fabianoalmeida"
set :scm_passphrase, "fbma110883"
set :user, 'fabianoalmeida'
set :branch, "master"
set :scm_verbose, true

ssh_options[:forward_agent] = true

server domain, :app, :web, :db, :primary => true

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  # task :restart, :roles => :app do
  #   run "touch #{current_release}/tmp/restart.txt"
  # end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
