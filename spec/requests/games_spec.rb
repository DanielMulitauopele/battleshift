require 'rails_helper'

# describe "Api::V1::Games" do
#   context "POST /api/v1/games " do
#     it "creates a game" do
#       user1 = create(:user)
#       user2 = create(:user)
#
#       game = create(
#         :game,
#         player_1_board: Board.new(4),
#         player_2_board: Board.new(4),
#         player_1_api_key: user1.api_key,
#         player_2_api_key: user2.api_key
#       )
#
#       headers = { "CONTENT_TYPE" => "application/json", "X-API-Key" => "#{user1.api_key}"}
#
#       post "/api/v1/games", headers: headers
#
#       new_game = Game.last
#       game_json = JSON.parse(response.body, symbolize_names: true)
#
#       expect(response).to be_successful
#       expect(game_json[:id]).to eq(new_game.id)
#     end
#   end
# end
