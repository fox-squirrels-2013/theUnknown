require 'sinatra/activerecord/rake'
require './app'

namespace :db do
  desc "create the postgres database"
  task :create do
    `createdb theU ` ##NAME YOUR DB
  end

  desc "drop the postgres database"
  task :drop do
    `dropdb theU` ##NAME YOUR DB
  end
end


