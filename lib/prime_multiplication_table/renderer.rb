module PrimeMultiplicationTable
  # Renderer contains implementation of table renderer functionality.
  class Renderer
    def initialize(primes_array)
      @primes_array = primes_array
    end

    def render
      @primes_array
    end
  end
end
