require 'spec_helper'

module ToyRobot
  RSpec.describe Toy do
    context '#new' do
      it 'sets direction_name' do
        @toy = Toy.new('NORTH', [5, 5])
        expect(@toy.direction_name).to eq :NORTH
      end

      it 'fail when invalid direction is used' do
        expect do
          Toy.new('MARS', [5, 5])
        end.to raise_error KeyError
      end
    end

    context '#update_position' do
      it 'sets new position' do
        @toy = Toy.new('NORTH', [5, 5])
        @toy.update_position([2, 3])

        expect(@toy.position).to eq [2, 3]
      end
    end

    context '#rotate' do
      before :each do
        @toy = Toy.new('NORTH', [5, 5])
      end

      it 'left' do
        @toy.rotate('LEFT')
        expect(@toy.direction).to eq [-1, 0]
      end

      it 'right' do
        @toy.rotate('RIGHT')
        expect(@toy.direction).to eq [1, 0]
      end

      it 'whole cirle in 4 left turns' do
        4.times { @toy.rotate('LEFT') }
        expect(@toy.direction).to eq [0, 1]
      end

      it 'whole cirle in 4 right turns' do
        4.times { @toy.rotate('RIGHT') }
        expect(@toy.direction).to eq [0, 1]
      end

      it 'update direction name on every turn' do
        @toy.rotate('RIGHT')
        expect(@toy.direction_name).to eq :EAST
        @toy.rotate('RIGHT')
        expect(@toy.direction_name).to eq :SOUTH
      end
    end
  end
end