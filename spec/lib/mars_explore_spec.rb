require 'spec_helper'
require_relative '../../app/lib/mars_explore'
 
describe MarsExplore do  
  describe '#explore' do
    context 'when upload a valid file' do
      let(:file) { File.open('spec/fixtures/valid_instructions.txt') }
      let(:subject) { described_class }

      it 'returns the robot position in the surface' do
        surface = subject.explore(file)
        expect(surface.top_x).to eq(5)
        expect(surface.top_y).to eq(5)
        expect(surface.robots.count).to eq(2)
      end
    end

    context 'when upload a invalid file' do
      let(:file) { File.open('spec/fixtures/invalid_instructions.txt') }
      let(:subject) { described_class }

      it 'returns the robot position in the surface' do
        expect { subject.explore(file) }.to raise_error(Surface::InvalidSurfaceCoordinatesError)
      end
    end
  end
end