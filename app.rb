require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base


  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    $game
    erb :play
  end

  get '/attack' do
    $game.attack($game.player_2)
    erb :attack
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
