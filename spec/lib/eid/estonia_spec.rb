# frozen_string_literal: true

RSpec.describe Eid::Estonia do
  describe '#valid?' do
    subject(:valid?) { described_class.new(identity).valid? }

    context 'when identity length is less than 11' do
      let(:identity) { 1_234_567_890 }

      it { expect(valid?).to be_falsey }
    end

    context 'when identity length is more than 11' do
      let(:identity) { 1_234_567_890_123 }

      it { expect(valid?).to be_falsey }
    end

    context 'when birth date is not valid date' do
      let(:identity) { 19_999_999_999 }

      it { expect(valid?).to be_falsey }
    end

    context 'when valid' do
      let(:identity) { 60_001_017_716 }

      it { expect(valid?).to be_truthy }
    end
  end

  describe '#female?' do
    subject(:female?) { described_class.new(identity).female? }

    context 'when identity begins with even' do
      let(:identity) { 60_001_017_716 }

      it { expect(female?).to be_truthy }
    end

    context 'when identity begins with odd' do
      let(:identity) { 39_901_019_992 }

      it { expect(female?).to be_falsey }
    end
  end

  describe '#male?' do
    subject(:male?) { described_class.new(identity).male? }

    context 'when identity begins with even' do
      let(:identity) { 60_001_018_800 }

      it { expect(male?).to be_falsey }
    end

    context 'when identity begins with odd' do
      let(:identity) { 51_501_017_721 }

      it { expect(male?).to be_truthy }
    end
  end

  describe '#gender' do
    subject(:gender) { described_class.new(identity).gender }

    context 'when identity begins with even' do
      let(:identity) { 40_404_049_996 }

      it { expect(gender).to eq(:female) }
    end

    context 'when identity begins with odd' do
      let(:identity) { 50_001_029_996 }

      it { expect(gender).to eq(:male) }
    end
  end

  describe '#birth_date' do
    subject(:birth_date) { described_class.new(identity).birth_date }

    context 'when begins with 1 or 2' do
      let(:identity) { 19_908_150_123 }

      it { expect(birth_date).to eq(Date.parse('1899.08.15')) }
    end

    context 'when begins with 3 or 4' do
      let(:identity) { 38_512_240_001 }

      it { expect(birth_date).to eq(Date.parse('1985.12.24')) }
    end

    context 'when begins with 5 or 6' do
      let(:identity) { 50_001_029_996 }

      it { expect(birth_date).to eq(Date.parse('2000.01.02')) }
    end

    context 'when begins with 7' do
      let(:identity) { 70_003_150_014 }

      it { expect(birth_date).to eq(Date.parse('2100.03.15')) }
    end
  end
end
