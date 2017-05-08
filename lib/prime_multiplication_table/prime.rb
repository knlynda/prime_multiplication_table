module PrimeMultiplicationTable
  # Prime contains implementation of comparable prime number.
  class Prime
    include Comparable

    attr_reader :value

    def initialize(position)
      @position = position
      @value = nth_prime(position)
    end

    def succ
      self.class.new(@position + 1)
    end

    def <=>(other)
      @value <=> other.value
    end

    def nth_prime(n)
      return Cache[n] if Cache[n]
      Cache.primes = compute_primes(n)
      Cache[n]
    end

    private
    def compute_primes(count)
      count
    end
  end
end
