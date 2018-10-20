class AiSpaceSelector
  def initialize(target_board, target = nil)
    @target_board = target_board
    @target = target
  end

  def fire!
    if @target == nil
      select_space.attack!
    else
      @target_board.locate_space(@target).attack!
    end
  end

  private
    attr_reader :target_board

    # def select_space
    #   non_targeted_spaces.sample.values.first
    # end

    # def non_targeted_spaces
    #   target_board.board.flatten.select do |raw_space|
    #     raw_space.values.first.not_attacked?
    #   end
    # end
end
