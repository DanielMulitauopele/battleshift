require 'rails_helper'

describe Shooter, type: :model do
  it 'exists' do
    attributes = {board: Board.new(4), target: "A1"}
    shooter = Shooter.new(attributes)

    expect(shooter).to be_a(Shooter)
  end
end
