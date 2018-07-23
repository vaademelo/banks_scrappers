# Require the gems listed in Gemfile
require 'bundler'
require_relative './setup-capybara'

Bundler.require(:default)
Dotenv.load

require 'pg'
require 'active_record'

#Require scrappers
Dir["./scrappers/*.rb"].each {|file| require file }
Dir["./bills/*.rb"].each {|file| require file }

# Set up a database that resides in RAM
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'utf8',
  database: 'bank_scrapper',
  pool: 5
)
