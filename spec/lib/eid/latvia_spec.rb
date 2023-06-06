# frozen_string_literal: true

RSpec.describe Eid::Latvia do
  describe '#legacy?' do
    subject(:legacy?) { described_class.new(identity).legacy? }

    context 'when not starts with 32' do
      let(:identity) { '150101-12345' }

      it { expect(legacy?).to be_truthy }
    end

    context 'when starts with 32' do
      let(:identity) { '320101-12345' }

      it { expect(legacy?).to be_falsey }
    end
  end

  describe '#valid?' do
    subject(:valid?) { described_class.new(identity).valid? }

    context 'when identity length is less than 12' do
      let(:identity) { '010571-1091' }

      it { expect(valid?).to be_falsey }
    end

    context 'when identity length is more than 11' do
      let(:identity) { '010571-1091234' }

      it { expect(valid?).to be_falsey }
    end

    context 'when birth date is not valid date' do
      let(:identity) { '199999-10900' }

      it { expect(valid?).to be_falsey }
    end

    context 'when valid' do
      context 'when legacy format' do
        let(:identity) { '010582-10305' }

        it { expect(valid?).to be_truthy }
      end

      context 'when new format' do
        let(:identity) { '322265-87972' }

        it { expect(valid?).to be_truthy }
      end
    end
  end

  describe '#birth_date' do
    subject(:birth_date) { described_class.new(identity).birth_date }

    context 'when legacy format' do
      context 'when begins with 1' do
        let(:identity) { '010598-10123' }

        it { expect(birth_date).to eq(Date.parse('1998.05.01')) }
      end

      context 'when begins with 2' do
        let(:identity) { '150303-20205' }

        it { expect(birth_date).to eq(Date.parse('2003.03.15')) }
      end
    end

    context 'when new format' do
      let(:identity) { '322265-87972' }

      it { expect(birth_date).to be_nil }
    end
  end
end
