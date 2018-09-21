require 'game'

describe Game do
  let(:tom) { double(:mock_person) }
  let(:jim) { double(:mock_person) }
  subject { described_class.new(tom, jim) }

  describe 'initialization' do
    it 'p1 & p2 are tom and jim' do
      expect(subject.players).to eq [tom, jim]
    end
  end

  describe '#attack' do
    it 'deducts 10 damage from p2' do
      allow(tom).to receive(:deduct).and_return true
      expect(subject.attack(1)).to eq true
    end
  end
end
