require 'player'

describe Player do
  let(:joe) { Player.new("Joe") }
  subject   { described_class.new("John") }
  context '#initialize' do
    it 'returns its name' do
      expect(subject.name).to eq "John"
    end
    it 'returns default max HP' do
      expect(subject.hp).to eq 60
    end
  end

  context '#deduct' do
    it 'deducts 10 hp' do
      expect { subject.deduct(10) }.to change { subject.hp }.by(-10)
    end
  end

end
