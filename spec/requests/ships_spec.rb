require 'rails_helper'

describe "Api::V1::Ships" do
  context "POST /api/v1/games/:id/ships" do
    it "places ships" do
      user1 = create(:user)
      user2 = create(:user)
      sm_ship = Ship.new(2)
      game = create(:game, player_1_board: Board.new(4), player_2_board: Board.new(4), player_1_api_key: user1.api_key, player_2_api_key: user2.api_key)

      headers = { "CONTENT_TYPE" => "application/json", "X-API-Key" => "#{user1.api_key}"}
      ships_json_payload = {ship_size: 2,
                        start_space: "A1",
                      end_space: "A2"
                    }.to_json
      post "/api/v1/games/#{game.id}/ships", params: ships_json_payload, headers: headers

      expect(response).to be_successful

      game = JSON.parse(response.body, symbolize_names: true)
      message = "Successfully placed ship with a size of 2. You have 0 ship(s) to place."

      expect(game[:message]).to eq(message)
    end
  end
end
