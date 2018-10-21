require 'rails_helper'
# require './app/services/turn_placer'

describe TurnProcessor do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @game = create(:game,
                player_1_board: Board.new(4),
                player_2_board: Board.new(4),
                player_1_api_key: @user1.api_key,
                player_2_api_key: @user2.api_key
              )
  end

  it 'processes turns' do
    tp = TurnProcessor.new(@game, "A1", @game.player_1_board)
    # expect(tp.run![:messages].to eq("Your shot resulted in a Miss"))
    #not passing, this draft test needs to be built out correctly
  end

  it "rejects invalid coordinates" do

  end

  it "rejects a move when it is not the player's turn" do

  end

end
