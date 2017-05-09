# Command line interface of prime_multiplication_table gem.
module PrimeMultiplicationTableCLI
  DEFAULT_TABLE_SIZE = 10

  class << self
    def run(args)
      puts "prime_multiplication_table (version: #{PrimeMultiplicationTable::VERSION})"
      size = parse_table_size_argument(args)
      prime_class = PrimeMultiplicationTable::Prime
      array = (prime_class.new(0)...prime_class.new(size)).map(&:value)
      puts PrimeMultiplicationTable::Renderer.new(array).render
    end

    def parse_table_size_argument(args)
      size = args.first.to_i
      size.positive? ? size : DEFAULT_TABLE_SIZE
    end
  end
end
