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
    # @messages << "Your shot resulted in a #{result}."
    require "pry"; binding.pry
    if @board.ships.all? do |ship|
        if ship.is_sunk?
          @messages << "Your shot resulted in a Hit. Battleship sunk. Game over."
        end
      end
      if @game.current_turn == "player_1"
        @game.winner = ENV["BATTLESHIFT_EMAIL"]
        @game.save
      else
        @game.winner = ENV["BATTLESHIFT_OPPONENT_EMAIL"]
        @game.save
      end
    else
      @board.ships.each do |ship|
        if ship.is_sunk?
          @messages << "Your shot resulted in a Hit. Battleship sunk."
        else
          @messages << "Your shot resulted in a #{result}."
        end
      end
    end
  end
end
