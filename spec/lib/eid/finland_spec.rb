# frozen_string_literal: true

RSpec.describe Eid::Finland do
  describe '#valid?' do
    subject(:valid?) { described_class.new(identity).valid? }

    context 'when identity length is less than 11' do
      let(:identity) { '010150-11X' }

      it { expect(valid?).to be_falsey }
    end

    context 'when identity length is more than 11' do
      let(:identity) { '010150-1145X' }

      it { expect(valid?).to be_falsey }
    end

    context 'when birth date is not valid date' do
      let(:identity) { '999999-113X' }

      it { expect(valid?).to be_falsey }
    end

    context 'when valid' do
      let(:identity) { '010158-125E' }

      it { expect(valid?).to be_truthy }
    end
  end

  describe '#female?' do
    subject(:female?) { described_class.new(identity).female? }

    context 'when identity with even' do
      let(:identity) { '240997-642F' }

      it { expect(female?).to be_truthy }
    end

    context 'when identity with odd' do
      let(:identity) { '010169-077R' }

      it { expect(female?).to be_falsey }
    end
  end

  describe '#male?' do
    subject(:male?) { described_class.new(identity).male? }

    context 'when identity with even' do
      let(:identity) { '010154-2402' }

      it { expect(male?).to be_falsey }
    end

    context 'when identity with odd' do
      let(:identity) { '010154-2431' }

      it { expect(male?).to be_truthy }
    end
  end

  describe '#gender' do
    subject(:gender) { described_class.new(identity).gender }

    context 'when identity with even' do
      let(:identity) { '010150-124F' }

      it { expect(gender).to eq(:female) }
    end

    context 'when identity with odd' do
      let(:identity) { '010150-129F' }

      it { expect(gender).to eq(:male) }
    end
  end

  describe '#birth_date' do
    subject(:birth_date) { described_class.new(identity).birth_date }

    context 'when in 1800' do
      let(:identity) { '270187+123A' }

      it { expect(birth_date).to eq(Date.parse('27.01.1887')) }
    end

    context 'when in 1900' do
      let(:identity) { '031091-2020' }

      it { expect(birth_date).to eq(Date.parse('03.10.1991')) }
    end

    context 'when in 2000' do
      let(:identity) { '150621F1234' }

      it { expect(birth_date).to eq(Date.parse('15.06.2021')) }
    end

    context 'when in 2100' do
      let(:identity) { '311201G123' }

      it { expect(birth_date).to eq(Date.parse('31.12.2101')) }
    end
  end
end
