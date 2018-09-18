# require 'sinatra/base'
#
# class Battle < Sinatra::Application
#   get '/' do
#     "Hello world!"
#   end
# end

require 'sinatra/base'

class Battle < Sinatra::Base
  get '/' do
    'Testing infrastructure working!'
  end
  run! if app_file == $0
end
