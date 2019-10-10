# require 'spec_helper'
# require_relative '../../models/position'
# require_relative '../../models/surface'
 
# describe Position do
#   describe '#move' do
#     context 'when can move the robot' do
#       let(:surface) { Surface.new('5 5') }
#       let(:position) { described_class.new('1', '1', surface) }

#       it 'updates the robot position' do
#         position.move('N')
#         expect(position.y).to eq(2)
#       end
#     end

#     context 'when can not move the robot' do
#       let(:surface) { Surface.new('5 5') }
#       let(:position) { described_class.new('1', '1', surface) }

#       it 'does not update the robot position' do
#         expect {
#           position.move('S')
#         }.not_to change { position.y }.from(1)
#       end
#     end
#   end
# end