require 'spec_helper'

module ToyRobot
  RSpec.describe Toy do

    context 'can move' do
      before do
        @start_pos = [5, 5]
      end

      it 'to NORTH' do
        toy = Toy.new('NORTH', @start_pos)
        toy.move

        expect(toy.position[1]).to eq @start_pos[1] + 1
        expect(toy.position[0]).to eq @start_pos[0]
      end

      it 'to SOUTH' do
        toy = Toy.new('SOUTH', @start_pos)
        toy.move

        expect(toy.position[1]).to eq @start_pos[1] - 1
        expect(toy.position[0]).to eq @start_pos[0]
      end

      it 'to WEST' do
        toy = Toy.new('WEST', @start_pos)
        toy.move

        expect(toy.position[1]).to eq @start_pos[1]
        expect(toy.position[0]).to eq @start_pos[0] - 1
      end

      it 'to EAST' do
        toy = Toy.new('EAST', @start_pos)
        toy.move

        expect(toy.position[1]).to eq @start_pos[1]
        expect(toy.position[0]).to eq @start_pos[0] + 1
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