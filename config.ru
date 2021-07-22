# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

require 'active_record'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

run Rails.application
Rails.application.load_seed
