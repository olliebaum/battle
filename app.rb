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
    session[:game] = Game.new(Player.new(params[:name1]), Player.new(params[:name2]))
    redirect to('/play')
  end

  get '/play' do
    @game = session[:game]
    redirect to('/game_over') if @game.game_over?
    erb(:play)
  end

  post '/attack' do   # attacking
    @game = session[:game]
    @game.attack(@game.current_attacker, 1)
    redirect to('/play')
  end

  post '/bigattack' do   # attacking
    @game = session[:game]
    @game.attack(@game.current_attacker, 2)
    session[:last_go_missed] = true
    redirect to('/play')
  end

  post '/rest' do   # attacking
    @game = session[:game]
    @game.rest(@game.current_attacker, 1)
    redirect to('/play')
  end

  post '/bigrest' do   # attacking
    @game = session[:game]
    @game.rest(@game.current_attacker, 2)
    session[:last_go_missed] = true
    redirect to('/play')
  end

  post '/new_turn' do   # attacking
    @game = session[:game]
    @game.missed_go(@game.current_attacker, false)
    @game.switch_turns
    redirect to('/play')
  end

  get '/game_over' do
    @game = session[:game]
    erb(:game_over)
  end

  run! if app_file == $0
end
