module PrimeMultiplicationTable
  # Cache contains already calculated prime numbers.
  module Cache
    class << self
      extend Forwardable
      attr_writer :primes

      def_delegators :primes, :[], :[]=, :last, :size

      def primes
        @primes ||= [2, 3]
      end
    end
  end
end
