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
        @toy_driver.place('NORTH', [1, 3])
        expect(@toy_driver.toy.position).to eq [1, 3]
        expect(@toy_driver.toy.direction).to eq [0, 1]
      end

      it 'replaces new toy' do
        @toy_driver.place('NORTH', [1, 3])
        @toy_driver.place('WEST', [4, 2])
        expect(@toy_driver.toy.position).to eq [4, 2]
        expect(@toy_driver.toy.direction).to eq [-1, 0]
      end

      it 'do nothing if possition is invalid' do
        @toy_driver.place('NORTH', [5, 5])
        expect(@toy_driver.toy).to be nil

        @toy_driver.place('NORTH', [6, 3])
        expect(@toy_driver.toy).to be nil

        @toy_driver.place('NORTH', [3, 6])
        expect(@toy_driver.toy).to be nil

        @toy_driver.place('NORTH', [3, -1])
        expect(@toy_driver.toy).to be nil

        @toy_driver.place('NORTH', [-1, 4])
        expect(@toy_driver.toy).to be nil

        
      end
    end

    context '#move' do
      it 'does nothing if not placed' do
        expect(@toy_driver.move).to eq nil
      end

      context 'update toy position' do
        it 'in NORTH direction' do
          @toy_driver.place('NORTH', [1, 3])
          @toy_driver.move

          expect(@toy_driver.toy.position).to eq([1, 4])
        end

        it 'in SOUTH direction' do
          @toy_driver.place('SOUTH', [2, 3])
          @toy_driver.move

          expect(@toy_driver.toy.position).to eq([2, 2])
        end

        it 'in WEST drection' do
          @toy_driver.place('WEST', [2, 3])
          @toy_driver.move

          expect(@toy_driver.toy.position).to eq([1, 3])
        end

        it 'in EAST direction' do
          @toy_driver.place('EAST', [1, 3])
          @toy_driver.move

          expect(@toy_driver.toy.position).to eq([2, 3])
        end
      end

      context 'do nothing if moving out of bounds' do
        it 'to North' do
          pos = [3, 4]
          @toy_driver.place('NORTH', pos)
          @toy_driver.move

          expect(@toy_driver.toy.position).to eq pos
        end

        it 'to South' do
          pos = [3, 0]
          @toy_driver.place('SOUTH', pos)
          @toy_driver.move

          expect(@toy_driver.toy.position).to eq pos
        end

        it 'to West' do
          pos = [0, 3]
          @toy_driver.place('WEST', pos)
          @toy_driver.move

          expect(@toy_driver.toy.position).to eq pos
        end

        it 'to East' do
          pos = [4, 3]
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
        @toy_driver.place('NORTH', [1, 3])
        @toy_driver.left
        expect(@toy_driver.toy.direction).to eq [-1, 0]
      end
    end

    context '#right' do
      it 'does nothing if not placed' do
        expect(@toy_driver.right).to eq nil
      end

      it 'updates toy direction' do
        @toy_driver.place('NORTH', [1, 3])
        @toy_driver.right
        expect(@toy_driver.toy.direction).to eq [1, 0]
      end
    end

    context '#report' do
      it 'does nothing if not placed' do
        expect(@toy_driver.report).to eq nil
      end

      it 'displaying toys direction and position' do
        @toy_driver.place('NORTH', [1, 3])
        expect do
          @toy_driver.report
        end.to output("1,3,NORTH\n").to_stdout
      end
    end

    context '#call' do
      actions = { place: [:place, :NORTH, [0, 0]],
                  left: [:left],
                  right: [:right],
                  report: [:report] }
      actions.each do |action, string|
        it "with #{string} calls correct method" do
          expect(@toy_driver).to receive(action)
          @toy_driver.call(string)
        end
      end
    end
  end
end
