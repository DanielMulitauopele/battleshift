module Api
  module V1
    module Games
      class ShipsController < ApiController
        def create
          game = Game.find(params[:game_id])
          ship = Ship.new(params[:ship_size])
          if request.headers["X-API-Key"] == game.player_1_api_key
            placer = ShipPlacer.new(board: game.player_1_board,
                                  ship: ship,
                                  start_space: params[:start_space],
                                  end_space: params[:end_space]
                                )
          elsif request.headers["X-API-Key"] == game.player_2_api_key
            placer = ShipPlacer.new(board: game.player_2_board,
                                  ship: ship,
                                  start_space: params[:start_space],
                                  end_space: params[:end_space]
                                )
          else
            render message: "GTFO"
          end
          placer.run

          game.save

          render json: game, message: success_message(params[:ship_size])
        end

        private
        def success_message(ship_size)
          if ship_size == 3
            "Successfully placed ship with a size of 3. You have 1 ship(s) to place with a size of 2."
          else
            "Successfully placed ship with a size of 2. You have 0 ship(s) to place."
          end
        end
      end
    end
  end
end
