require 'data_mapper'
require 'dm-postgres-adapter'

require_relative '../models/link'
require_relative '../models/tag'

#OTHER USER'S CONNECTION STRING
#DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

#GLENN'S CONNECTION STRING
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://postgres:password@localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
#DataMapper.auto_upgrade!
