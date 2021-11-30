require_relative '../lib/game'

describe Game do
  describe 'Response' do
    describe '#check_quantity' do
      subject(:game_response) { described_class.new }

      context 'when params %w[4 knife tallrack]' do
        it 'returns quantity of 4' do
          _, result = game_response.check_quantity %w[4 knife tallrack]
          expect(result).to eq(4)
        end
      end

      context 'when params %w[knife tallrack]' do
        it 'returns quantity of 1' do
          _, result = game_response.check_quantity %w[knife tallrack]
          expect(result).to eq(1)
        end
      end
    end
  end
end
