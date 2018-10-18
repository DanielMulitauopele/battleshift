module Api
  module V1
    module Games
      class ShotsController < ApiController
        def create
          game = Game.find(params[:game_id])
          if game.winner == nil
            if game.valid_space?(params[:target])
              if request.headers["X-API-Key"] == game.player_1_api_key && game.current_turn == "player_1"
                turn_processor = TurnProcessor.new(game, params[:shot][:target], game.player_2_board)
                turn_processor.run!
                render json: game, message: turn_processor.message
              elsif request.headers["X-API-Key"] == game.player_2_api_key && game.current_turn == "player_2"
                turn_processor = TurnProcessor.new(game, params[:shot][:target], game.player_1_board)
                turn_processor.run!
                render json: game, message: turn_processor.message
              elsif request.headers["X-API-Key"] == game.player_2_api_key && game.current_turn == "player_1"
                render json: game, status: 400, message: "Invalid move. It's your opponent's turn"
              elsif request.headers["X-API-Key"] == game.player_1_api_key && game.current_turn == "player_2"
                render json: game, status: 400, message: "Invalid move. It's your opponent's turn"
              else
              end
            else
              render json: game, status: 400, message: "Invalid coordinates"
            end
          else
            # End the game
            # Render "Player is the winner!"
            render message: "Winner winner chicken dinner"
          end
        end
      end
    end
  end
end
