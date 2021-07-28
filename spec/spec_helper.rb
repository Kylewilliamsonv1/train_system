require 'simplecov'
SimpleCov.start
require 'rspec'
require 'pg'
require 'train'
require 'city'
require 'pry'
require 'simplecov'

DB = PG.connect({:dbname => 'train_system_test', :password => 'password'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM trains *;")
    DB.exec("DELETE FROM cities *;")
  end
end