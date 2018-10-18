module Api
  module V1
    class GamesController < ActionController::API
      def show
        game = Game.find_by_id(params[:id])
        if game
          render json: game
        else
          render status: 400
        end
      end

      def create
        p1_board = Board.new(4)
        p2_board = Board.new(4)
        p1 = Player.new(p1_board)
        p2 = Player.new(p2_board)
        game = Game.create!(
          player_1_board: p1.board,
          player_2_board: p2.board
        )
        game.player_1_api_key = ENV['BATTLESHIFT_API_KEY']
        game.player_2_api_key = ENV['BATTLESHIFT_OPPONENT_API_KEY']
        game.save
        render json: game
      end

      private

      def game_params
        params.require(:game).permit(:id, :player_1_board, :player_2_board, :winner, :player_1_turns, :player_2_turns, :current_turn)
      end
    end
  end
end
