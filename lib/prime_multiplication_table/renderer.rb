module PrimeMultiplicationTable
  # Renderer contains implementation of table renderer functionality.
  class Renderer
    def initialize(primes_array)
      @primes_array = primes_array
    end

    def render
      matrix.map { |r| render_row(r) }.join("\n")
    end

    private

    def render_row(row_array)
      row_array.each_with_index.map { |c, i| c.to_s.rjust(cell_size(i)) }.join(' ')
    end

    def matrix
      @matrix ||= [[nil] + @primes_array] + @primes_array.map do |prime_x|
        @primes_array.each_with_index.each_with_object([]) do |(prime_y, index), result|
          result << prime_x if index.to_i.zero?
          result << prime_x * prime_y
        end
      end
    end

    def cell_size(cell_index)
      matrix.last[cell_index].to_s.size
    end
  end
end
