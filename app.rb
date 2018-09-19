# require 'sinatra/base'
#
# class Battle < Sinatra::Application
#   get '/' do
#     "Hello world!"
#   end
# end

require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:name1] = Player.new(params[:name1])
    session[:name2] = Player.new(params[:name2])
    $p1 = session[:name1]  #should we stop using global variables??
    $p2 = session[:name2]
    $game = Game.new($p1, $p2)
    redirect to('/play')
  end

  get '/play' do
    @hp_max = 60
    @attack = session[:attack] #decide on process for @attack and session[:attack] (true and false)
    if @attack
      $game.attack($p1, $p2)
      @attack = false
    end
    erb(:play)
  end

  post '/play' do   # attacking
    session[:attack] = true
    redirect to('/play')
  end

  run! if app_file == $0
end
