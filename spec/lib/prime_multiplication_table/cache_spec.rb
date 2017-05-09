require 'spec_helper'

RSpec.describe PrimeMultiplicationTable::Cache do
  it { is_expected.to respond_to :primes, :primes=, :[], :[]=, :last, :size }

  describe '.primes' do
    subject { described_class.primes }

    it { is_expected.to eql [2, 3] }
  end
end
