require 'spec_helper'

RSpec.describe PrimeMultiplicationTable::Cache do
  describe '.primes' do
    subject { described_class.primes }

    it { is_expected.to eql [2, 3] }
  end
end
