class TurnProcessor
  def initialize(game, target)
    @game   = game
    @target = target
    @messages = []
  end

  def run!
    begin
      attack_opponent
      ai_attack_back
      game.save!
    rescue InvalidAttack => e
      @messages << e.message
    end
  end

  def message
    @messages.join(" ")
  end

  private

  attr_reader :game, :target

  def player
    Player.new(game.player_1_board)
  end

  def opponent
    Player.new(game.player_2_board)
  end

  def attack_opponent
    if game.current_turn == "challenger"
      result = Shooter.fire!(board: opponent.board, target: target)
      @messages << "Your shot resulted in a #{result}."
      if game.player_1_turns == nil
        game.player_1_turns = 1
      else
        game.player_1_turns += 1
      end
    else
      @messages << "Invalid move. It's your opponent's turn"
    end
    change_turn
  end

  def ai_attack_back
    if game.current_turn == "computer"
      if @target == nil
        result = AiSpaceSelector.new(player.board).fire!
        @messages << "The computer's shot resulted in a #{result}."
        if game.player_2_turns == nil
          game.player_2_turns = 1
        else
          game.player_2_turns += 1
        end
      else
        AiSpaceSelector.new(player.board, @target).fire!
        @messages << "The computer's shot resulted in a #{result}."
        if game.player_2_turns == nil
          game.player_2_turns = 1
        else
          game.player_2_turns += 1
        end
      end
    else
      @messages << "Invalid move. It's your opponent's turn"
    end
    change_turn
  end

  def change_turn
    if game.current_turn == "challenger"
      game.current_turn = "computer"
    else
      game.current_turn = "challenger"
    end
  end
end
