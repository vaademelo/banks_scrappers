# Require the gems listed in Gemfile
require 'bundler'
require_relative './setup-capybara'

Bundler.require(:default)
Dotenv.load

#Require scrappers
Dir["./scrappers/*.rb"].each {|file| require file }
