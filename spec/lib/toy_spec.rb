require 'spec_helper'

module ToyRobot
  RSpec.describe Toy do

    context 'can move' do
      before do
        @start_pos = {x: 5, y: 5}
      end

      it 'to NORTH' do
        toy = Toy.new('NORTH', @start_pos)
        toy.move

        expect(toy.position[:y]).to eq @start_pos[:y] + 1
        expect(toy.position[:x]).to eq @start_pos[:x]
      end

      it 'to SOUTH' do
        toy = Toy.new('SOUTH', @start_pos)
        toy.move

        expect(toy.position[:y]).to eq @start_pos[:y] - 1
        expect(toy.position[:x]).to eq @start_pos[:x]
      end

      it 'to WEST' do
        toy = Toy.new('WEST', @start_pos)
        toy.move

        expect(toy.position[:y]).to eq @start_pos[:y]
        expect(toy.position[:x]).to eq @start_pos[:x] - 1
      end

      it 'to EAST' do
        toy = Toy.new('EAST', @start_pos)
        toy.move

        expect(toy.position[:y]).to eq @start_pos[:y]
        expect(toy.position[:x]).to eq @start_pos[:x] + 1
      end
    end

    context 'can rotate' do
      before :each do
        @toy = Toy.new('NORTH', x: 5, y: 5)
      end

      it 'left' do
        @toy.rotate('LEFT')
        expect(@toy.direction.x).to eq(-1)
        expect(@toy.direction.y).to eq(0)
      end

      it 'right' do
        @toy.rotate('RIGHT')
        expect(@toy.direction.x).to eq(1)
        expect(@toy.direction.y).to eq(0)
      end
    end
  end
end