require 'spec_helper'
require_relative '../../app/models/position'
require_relative '../../app/models/surface'
 
describe Position do
  describe '#move' do
    context 'when can move the robot' do
      let(:surface) { Surface.new('5 5') }
      let(:position) { described_class.new('1', '1', surface) }

      it 'updates the robot position' do
        position.move('N')
        expect(position.y).to eq(2)
      end
    end

    context 'when can not move the robot' do
      let(:surface) { Surface.new('5 5') }
      let(:position) { described_class.new('5', '5', surface) }

      it 'does not update the robot position' do
        expect {
          position.move('W')
        }.not_to change { position.y }.from(5)
      end
    end
  end
end
