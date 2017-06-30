require 'spec_helper'

module ToyRobot
  RSpec.describe Toy do
    context '#update_position' do
      it 'sets new position' do
        @toy = Toy.new('NORTH', [5, 5])
        @toy.update_position([2, 3])

        expect(@toy.position).to eq [2, 3]
      end
    end

    context 'can rotate' do
      before :each do
        @toy = Toy.new('NORTH', [5, 5])
      end

      it 'left' do
        @toy.rotate('LEFT')
        expect(@toy.direction[0]).to eq(-1)
        expect(@toy.direction[1]).to eq(0)
      end

      it 'right' do
        @toy.rotate('RIGHT')
        expect(@toy.direction[0]).to eq(1)
        expect(@toy.direction[1]).to eq(0)
      end
    end
  end
end