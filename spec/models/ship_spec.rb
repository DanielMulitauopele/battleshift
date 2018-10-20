require 'rails_helper'

describe Ship do
  length = 2
  ship = Ship.new(length)

  it 'exists' do
    expect(ship).to be_a(Ship)
  end

  describe 'instance methods' do
    context '#receive_hit_damage' do
      it "increases ship damage" do
        expect(ship.receive_hit_damage).to eq(1)
      end
    end
  end
end
