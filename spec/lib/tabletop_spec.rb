require 'spec_helper'

module ToyRobot
  RSpec.describe TableTop do
    before do
      @table_top = TableTop.new
    end

    it 'starts without toy on table' do
      expect(@table_top.toy).to be nil
    end

    context '#place' do
      it 'creates new toy' do
        @table_top.place('NORTH', x: 1, y: 3)
        expect(@table_top.toy.position).to eq x: 1, y: 3
        expect(@table_top.toy.direction.to_h).to eq DIRECTIONS[:NORTH].to_h
      end

      it 'replaces new toy' do
        @table_top.place('NORTH', x: 1, y: 3)
        @table_top.place('WEST', x: 4, y: 2)
        expect(@table_top.toy.position).to eq x: 4, y: 2
        expect(@table_top.toy.direction.to_h).to eq DIRECTIONS[:WEST].to_h
      end

      it 'do nothing if possition is invalid' do
        @table_top.place('NORTH', x: 6, y: 3)
        expect(@table_top.toy).to be nil

        @table_top.place('NORTH', x: 3, y: 6)
        expect(@table_top.toy).to be nil

        @table_top.place('NORTH', x: 3, y: -1)
        expect(@table_top.toy).to be nil

        @table_top.place('NORTH', x: -1, y: 4)
        expect(@table_top.toy).to be nil
      end
    end

    context '#move' do
      it 'does nothing if not placed' do
        expect(@table_top.move).to eq nil
      end

      it 'update toys position' do
        @table_top.place('NORTH', x: 1, y: 3)
        @table_top.move
        expect(@table_top.toy.position).to eq(x: 1, y: 4)
      end

      context 'do nothing if moving out of bounds' do
        it 'to North' do
          pos = { x: 3, y: 5 }
          @table_top.place('NORTH', pos)
          @table_top.move

          expect(@table_top.toy.position).to eq pos
        end

        it 'to South' do
          pos = { x: 3, y: 0 }
          @table_top.place('SOUTH', pos)
          @table_top.move

          expect(@table_top.toy.position).to eq pos
        end

        it 'to West' do
          pos = { x: 0, y: 3 }
          @table_top.place('WEST', pos)
          @table_top.move

          expect(@table_top.toy.position).to eq pos
        end

        it 'to East' do
          pos = { x: 5, y: 3 }
          @table_top.place('EAST', pos)
          @table_top.move

          expect(@table_top.toy.position).to eq pos
        end
      end
    end

    context '#left' do
      it 'does nothing if not placed' do
        expect(@table_top.left).to eq nil
      end

      it 'updates toy direction' do
        @table_top.place('NORTH', x: 1, y: 3)
        @table_top.left
        expect(@table_top.toy.direction.to_h).to eq DIRECTIONS[:WEST].to_h
      end
    end

    context '#right' do
      it 'does nothing if not placed' do
        expect(@table_top.right).to eq nil
      end

      it 'updates toy direction' do
        @table_top.place('NORTH', x: 1, y: 3)
        @table_top.right
        expect(@table_top.toy.direction.to_h).to eq DIRECTIONS[:EAST].to_h
      end
    end

    context '#report' do
      it 'does nothing if not placed' do
        expect(@table_top.report).to eq nil
      end

      it 'displaying toys direction and position' do
        @table_top.place('NORTH', x: 1, y: 3)
        expect do
          @table_top.report
        end.to output("At {:x=>1, :y=>3}, facing NORTH\n").to_stdout
      end
    end
  end
end
