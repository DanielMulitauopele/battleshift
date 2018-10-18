module Api
  module V1
    module Games
      class ShotsController < ApiController
        def create
          game = Game.find(params[:game_id])
          user = User.find_by(api_key: request.headers["X-API-Key"])
          turn_processor = TurnProcessor.new(game, params[:shot][:target])

          turn_processor.run!
          render json: game, message: turn_processor.message
        end
      end
    end
  end
end
