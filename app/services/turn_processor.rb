class TurnProcessor
  def initialize(game, target, board)
    @game   = game
    @target = target
    @board = board
    @messages = []
  end

  def run!
    begin
      attack
      change_turn
      game.save!
    rescue InvalidAttack => e
        @messages << e.message
    end
  end

  def message
    @messages.join(" ")
  end

  def change_turn
    if game.current_turn == "player_1"
      game.current_turn = "player_2"
    else
      game.current_turn = "player_1"
    end
  end


  private

  attr_reader :game, :target

  def attack
    result = Shooter.fire!(board: @board, target: target)
    @messages << "Your shot resulted in a #{result}."
    # if game.player_1_turns == nil
    #   game.player_1_turns = 1
    # else
    #   game.player_1_turns += 1
    # end
  end
end
