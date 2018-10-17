module Api
  module V1
    module Games
      class ShipsController < ApiController
        def create
          game = Game.find(params[:game_id])
          ship = Ship.new(params[:ship_size])
          p1_placer = ShipPlacer.new(board: game.player_1_board,
                                  ship: ship,
                                  start_space: params[:start_space],
                                  end_space: params[:end_space]
                                )
          p1_placer.run
          p2_placer = ShipPlacer.new(board: game.player_2_board,
                                  ship: ship,
                                  start_space: params[:start_space],
                                  end_space: params[:end_space]
                                )
          p2_placer.run

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
