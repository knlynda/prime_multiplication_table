require 'spec_helper'

RSpec.describe PrimeMultiplicationTable::Renderer do
  describe '#render' do
    subject { described_class.new(table_basis).render }

    context 'when table_basis is empty' do
      let(:table_basis) { [] }
      it { is_expected.to be_empty }
    end

    context 'when table_basis is not empty' do
      let(:table_basis) { [1, 2, 3] }
      it { is_expected.to eql "  1 2 3\n1 1 2 3\n2 2 4 6\n3 3 6 9" }
    end

    context 'when table_basis includes big and small numbers' do
      let(:table_basis) { [11, 2, 33] }
      it { is_expected.to eql "    11  2   33\n11 121 22  363\n 2  22  4   66\n33 363 66 1089" }
    end
  end
end
