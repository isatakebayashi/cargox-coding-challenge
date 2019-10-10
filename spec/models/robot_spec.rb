require 'spec_helper'
require_relative '../../app/models/direction'
require_relative '../../app/models/position'
require_relative '../../app/models/robot'

describe Robot do
  describe 'give instructions to robot' do
    context 'when instructions are valid' do
      let(:surface) { Surface.new('5 5') }
      let(:robot) { Robot.new(1, '1 3 N', surface) }

      it 'updates the robot position' do
        robot.handle_instructions('LMLMLM')
        expect(robot.direction.current).to eq('E')
      end
    end

    context 'when instructions are invalid' do
      let(:surface) { Surface.new('5 5') }
      let(:robot) { Robot.new(1, '1 3 N', surface) }

      it 'does not updates the robot position' do
        expect {
          robot.handle_instructions('MMMMMM')
        }.not_to change { robot.direction.current }.from('N')

      end
    end
  end
end
