require 'game'

describe Game do
  let(:tom) { double(:mock_person) }
  let(:jim) { double(:mock_person) }
  subject { described_class.new(tom, jim) }
  describe 'initialization' do
    it 'p1 & p2 are tom and jim' do
      expect(subject.p1).to eq(tom)
      expect(subject.p2).to eq(jim)
    end
  end

  describe '#attack' do
    it 'deducts 10 damage from p2' do
      allow(jim).to receive(:deduct)
      expect(subject.p2).to receive(:deduct)
      subject.attack(tom, jim)
    end
  end
end
