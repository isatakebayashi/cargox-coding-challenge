require 'spec_helper'
require_relative '../direction'
 
describe Direction do
  describe '#change' do
    context 'when direction is valid' do
      let(:direction) { described_class.new('W') }

      it 'updates the current direction' do
        direction.change('L')
        expect(direction.current).to eq('S')
      end
    end

    context 'when direction is invalid' do
      let(:direction) { described_class.new('W') }

      it 'does not change the current direction' do
        expect {
          direction.change('A')
        }.not_to change { direction.current }.from('W')
      end
    end
  end
end