# frozen_string_literal: true

RSpec.describe Eid::Estonia do
  describe '#valid?' do
    subject(:valid?) { described_class.new(identity).valid? }

    context 'when identity length is less than 11' do
      let(:identity) { '1234567890' }

      it { expect(valid?).to be_falsey }
    end

    context 'when identity length is more than 11' do
      let(:identity) { '1234567890123' }

      it { expect(valid?).to be_falsey }
    end

    context 'when birth date is not valid date' do
      let(:identity) { '19999999999' }

      it { expect(valid?).to be_falsey }
    end

    context 'when valid' do
      let(:identity) { '60001017716' }

      it { expect(valid?).to be_truthy }
    end
  end

  describe '#female?' do
    subject(:female?) { described_class.new(identity).female? }

    context 'when identity begins with even' do
      let(:identity) { '60001017716' }

      it { expect(female?).to be_truthy }
    end

    context 'when identity begins with odd' do
      let(:identity) { '39901019992' }

      it { expect(female?).to be_falsey }
    end
  end

  describe '#male?' do
    subject(:male?) { described_class.new(identity).male? }

    context 'when identity begins with even' do
      let(:identity) { '60001018800' }

      it { expect(male?).to be_falsey }
    end

    context 'when identity begins with odd' do
      let(:identity) { '51501017721' }

      it { expect(male?).to be_truthy }
    end
  end

  describe '#gender' do
    subject(:gender) { described_class.new(identity).gender }

    context 'when identity begins with even' do
      let(:identity) { '40404049996' }

      it { expect(gender).to eq(:female) }
    end

    context 'when identity begins with odd' do
      let(:identity) { '50001029996' }

      it { expect(gender).to eq(:male) }
    end
  end

  describe '#birth_date' do
    subject(:birth_date) { described_class.new(identity).birth_date }

    context 'when begins with 1 or 2' do
      let(:identity) { '19908150123' }

      it { expect(birth_date).to eq(Date.parse('1899.08.15')) }
    end

    context 'when begins with 3 or 4' do
      let(:identity) { '38512240001' }

      it { expect(birth_date).to eq(Date.parse('1985.12.24')) }
    end

    context 'when begins with 5 or 6' do
      let(:identity) { '50001029996' }

      it { expect(birth_date).to eq(Date.parse('2000.01.02')) }
    end

    context 'when begins with 7' do
      let(:identity) { '70003150014' }

      it { expect(birth_date).to eq(Date.parse('2100.03.15')) }
    end
  end
end
