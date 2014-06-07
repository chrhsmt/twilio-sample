require "active_record"
require_relative 'user'

ActiveRecord::Base.configurations = YAML.load_file('config/database.yml')
if development?
    ActiveRecord::Base.establish_connection(:development)
else
    ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
end
