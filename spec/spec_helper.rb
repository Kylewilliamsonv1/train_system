require 'rspec'
require 'pg'
require 'album'
require 'song'
require 'pry'
require 'artist'

DB = PG.connect({:dbname => 'train_system_test', :password => 'password'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM albums *;")
    DB.exec("DELETE FROM songs *;")
  end
end