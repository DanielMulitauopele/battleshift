class Game < ApplicationRecord
  attr_accessor :messages

  enum current_turn: ["player_1", "player_2"]
  serialize :player_1_board
  serialize :player_2_board

  validates :player_1_board, presence: true
  validates :player_2_board, presence: true

  def valid_space?(target)
    player_1_board.board.flatten.any? do |space|
      space.keys.first == target
    end
  end
end
