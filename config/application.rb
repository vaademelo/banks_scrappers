# Require the gems listed in Gemfile
require 'bundler'

Bundler.require(:default)
Dotenv.load

require 'pg'
require 'active_record'

require_relative './setup-capybara'

Dir["scrappers/*.rb"].each {|file| require_relative "../#{file}" }
Dir["bills/*.rb"].each {|file| require_relative "../#{file}" }

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'utf8',
  database: 'bank_scrapper',
  pool: 5
)
