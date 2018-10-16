module Api
  module V1
    module Games
      class ShipsController < ApiController
        def create
          game = Game.find(params[:game_id])
          ship = Ship.new(params[:ship_size])
          # Method that "places" ship which adds message to game
          # if ShipPlacer.new is valid
          game.messages = "hi"
          render json: game
        end
      end
    end
  end
end
