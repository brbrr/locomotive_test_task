require 'spec_helper'


module ToyRobot
  RSpec.describe Vector do
    context 'can rotate' do
      before do
        @vector = Vector.new(1, 0)
      end

      it 'raise a error for invalid direction' do
        expect { @vector.rotate(:invalid) }.to raise_error RuntimeError
      end

      it 'clockwise by 90 deg' do
        @vector.rotate('LEFT')
        expect(@vector.x).to eq(0)
        expect(@vector.y).to eq(1)

        @vector.rotate('LEFT')
        expect(@vector.x).to eq(-1)
        expect(@vector.y).to eq(0)

        @vector.rotate('LEFT')
        expect(@vector.x).to eq(0)
        expect(@vector.y).to eq(-1)

        @vector.rotate('LEFT')
        expect(@vector.x).to eq(1)
        expect(@vector.y).to eq(0)
      end

      it 'conter clockwise by 90 deg' do
        @vector.rotate('RIGHT')
        expect(@vector.x).to eq(0)
        expect(@vector.y).to eq(-1)

        @vector.rotate('RIGHT')
        expect(@vector.x).to eq(-1)
        expect(@vector.y).to eq(0)

        @vector.rotate('RIGHT')
        expect(@vector.x).to eq(0)
        expect(@vector.y).to eq(1)

        @vector.rotate('RIGHT')
        expect(@vector.x).to eq(1)
        expect(@vector.y).to eq(0)
      end
    end
  end  
end
