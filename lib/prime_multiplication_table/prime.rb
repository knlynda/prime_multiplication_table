module PrimeMultiplicationTable
  # Prime contains implementation of comparable prime number.
  class Prime
    include Comparable
    include AtkinSieve

    attr_reader :value

    def initialize(position)
      @position = position
      @value = nth_prime(@position)
    end

    def succ
      self.class.new(@position + 1)
    end

    def <=>(other)
      @value <=> other.value
    end
  end
end
