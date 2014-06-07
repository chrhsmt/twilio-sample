source "https://rubygems.org"

ruby '2.1.0'

gem "sinatra"
gem "sinatra-contrib"
gem "activerecord"
gem "sinatra-activerecord", :require => 'sinatra/activerecord'
gem "rake"

gem "sass"
gem "coffee-script"

gem "twilio-ruby"

group :development do
  gem 'sqlite3'
end
 
group :production do
  gem 'pg'
  gem "activerecord-postgresql-adapter"
end