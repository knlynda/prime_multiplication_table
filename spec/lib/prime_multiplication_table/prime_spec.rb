require 'spec_helper'

RSpec.describe PrimeMultiplicationTable::Prime do
  describe '#succ' do
    subject { described_class.new(position) }

    context 'when position is zero' do
      let(:position) { 0 }
      it { expect(subject.value).to eql 2 }
    end

    context 'when position is 1' do
      let(:position) { 1 }
      it { expect(subject.value).to eql 3 }
    end

    context 'when position is 499' do
      let(:position) { 499 }
      it { expect(subject.value).to eql 3571 }
    end

    context 'when position is -1' do
      let(:position) { -1 }
      it { expect(subject.value).to eql PrimeMultiplicationTable::Cache[-1] }
    end

    context 'when position is -500_000' do
      let(:position) { -500_000 }
      it { expect(subject.value).to be_nil }
    end
  end

  describe '#nth_prime' do
    subject { described_class.new(position).nth_prime(new_position) }

    context 'when position is zero and new_position is 1' do
      let(:position) { 0 }
      let(:new_position) { 1 }

      it { is_expected.to eql 3 }
    end

    context 'when position is zero and new_position is zero' do
      let(:position) { 0 }
      let(:new_position) { 0 }

      it { is_expected.to eql 2 }
    end

    context 'when position is zero and new_position is 499' do
      let(:position) { 0 }
      let(:new_position) { 499 }

      it { is_expected.to eql 3571 }
    end

    context 'when position is zero and new_position is -1' do
      let(:position) { 0 }
      let(:new_position) { -1 }

      it { is_expected.to eql PrimeMultiplicationTable::Cache[-1] }
    end

    context 'when position is zero and new_position is -500_000' do
      let(:position) { 0 }
      let(:new_position) { -500_000 }

      it { is_expected.to be_nil }
    end
  end
end
