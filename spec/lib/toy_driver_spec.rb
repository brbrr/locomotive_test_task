require 'spec_helper'

module ToyRobot
  RSpec.describe ToyDriver do
    before do
      @toy_driver = ToyDriver.new
    end

    it 'starts without toy on table' do
      expect(@toy_driver.toy).to be nil
    end

    context '#place' do
      it 'creates new toy' do
        @toy_driver.place('NORTH', x: 1, y: 3)
        expect(@toy_driver.toy.position).to eq x: 1, y: 3
        expect(@toy_driver.toy.direction.to_h).to eq DIRECTIONS[:NORTH].to_h
      end

      it 'replaces new toy' do
        @toy_driver.place('NORTH', x: 1, y: 3)
        @toy_driver.place('WEST', x: 4, y: 2)
        expect(@toy_driver.toy.position).to eq x: 4, y: 2
        expect(@toy_driver.toy.direction.to_h).to eq DIRECTIONS[:WEST].to_h
      end

      it 'do nothing if possition is invalid' do
        @toy_driver.place('NORTH', x: 6, y: 3)
        expect(@toy_driver.toy).to be nil

        @toy_driver.place('NORTH', x: 3, y: 6)
        expect(@toy_driver.toy).to be nil

        @toy_driver.place('NORTH', x: 3, y: -1)
        expect(@toy_driver.toy).to be nil

        @toy_driver.place('NORTH', x: -1, y: 4)
        expect(@toy_driver.toy).to be nil
      end
    end

    context '#move' do
      it 'does nothing if not placed' do
        expect(@toy_driver.move).to eq nil
      end

      it 'update toys position' do
        @toy_driver.place('NORTH', x: 1, y: 3)
        @toy_driver.move
        expect(@toy_driver.toy.position).to eq(x: 1, y: 4)
      end

      context 'do nothing if moving out of bounds' do
        it 'to North' do
          pos = { x: 3, y: 5 }
          @toy_driver.place('NORTH', pos)
          @toy_driver.move

          expect(@toy_driver.toy.position).to eq pos
        end

        it 'to South' do
          pos = { x: 3, y: 0 }
          @toy_driver.place('SOUTH', pos)
          @toy_driver.move

          expect(@toy_driver.toy.position).to eq pos
        end

        it 'to West' do
          pos = { x: 0, y: 3 }
          @toy_driver.place('WEST', pos)
          @toy_driver.move

          expect(@toy_driver.toy.position).to eq pos
        end

        it 'to East' do
          pos = { x: 5, y: 3 }
          @toy_driver.place('EAST', pos)
          @toy_driver.move

          expect(@toy_driver.toy.position).to eq pos
        end
      end
    end

    context '#left' do
      it 'does nothing if not placed' do
        expect(@toy_driver.left).to eq nil
      end

      it 'updates toy direction' do
        @toy_driver.place('NORTH', x: 1, y: 3)
        @toy_driver.left
        expect(@toy_driver.toy.direction.to_h).to eq DIRECTIONS[:WEST].to_h
      end
    end

    context '#right' do
      it 'does nothing if not placed' do
        expect(@toy_driver.right).to eq nil
      end

      it 'updates toy direction' do
        @toy_driver.place('NORTH', x: 1, y: 3)
        @toy_driver.right
        expect(@toy_driver.toy.direction.to_h).to eq DIRECTIONS[:EAST].to_h
      end
    end

    context '#report' do
      it 'does nothing if not placed' do
        expect(@toy_driver.report).to eq nil
      end

      it 'displaying toys direction and position' do
        @toy_driver.place('NORTH', x: 1, y: 3)
        expect do
          @toy_driver.report
        end.to output("1,3,NORTH\n").to_stdout
      end
    end

    context '#call' do
      actions = { place: 'PLACE 0,0,NORTH',
                  left: 'LEFT',
                  right: 'RIGHT',
                  report: 'REPORT' }
      actions.each do |action, string|
        it "with #{string} calls correct method" do
          expect(@toy_driver).to receive(action)
          @toy_driver.call(string)
        end
      end
    end
  end
end
