module PrimeMultiplicationTable
  # AtkinSieve contains implementation of atkin algorithm to find prime numbers.
  module AtkinSieve
    def nth_prime(n)
      return Cache[n] if Cache[n]
      Cache.primes = compute_primes(n)
      Cache[n]
    end

    private

    def compute_primes(count)
      return Cache.primes if Cache.size > count
      sieve_size = compute_sieve_size(count)
      atkin_sieve(sieve_size).each_with_index.map { |v, p| p if v }.compact
    end

    # TODO: 52 should be replaced with algorithm to find range which cover expected count of prime numbers
    #
    # As we know  the range 1..10**23 contains 1_925_320_391_606_803_968_923 prime numbers
    #   (so, the range contains 1.92 % on prime numbers)
    # to find 100 prime numbers we need to create sieve 100 * (100 / 1.92) or 100 * 52
    def compute_sieve_size(count)
      count * 52
    end

    def atkin_sieve(sieve_size)
      sieve = init_sieve
      filter_sieve(sieve, sieve_size)
      finalize_sieve(sieve, sieve_size)
      sieve
    end

    def init_sieve
      # 0,  1,   2,    3
      [nil, nil, true, true]
    end

    def filter_sieve(sieve, sieve_size)
      sieve_size_sqrt = Math.sqrt(sieve_size).floor

      (1..sieve_size_sqrt).each do |x|
        (1..sieve_size_sqrt).each do |y|
          filter_sieve_iteration(sieve, sieve_size, x, y)
        end
      end
    end

    def finalize_sieve(sieve, sieve_size)
      sieve_size_sqrt = Math.sqrt(sieve_size).floor

      (5..sieve_size_sqrt).each do |n|
        next if Cache[n] || !sieve[n]
        step = n**2
        (step..sieve_size).step(step) do |not_prime|
          sieve[not_prime] = false
        end
      end
    end

    def filter_sieve_iteration(sieve, sieve_size, x, y)
      x2 = x**2
      y2 = y**2

      apply_first_filter(sieve, sieve_size, x2, y2)
      apply_second_filter(sieve, sieve_size, x2, y2)
      apply_third_filter(sieve, sieve_size, x2, y2) if x > y
    end

    def apply_first_filter(sieve, sieve_size, x2, y2)
      n = x2 * 4 + y2
      sieve[n] = !sieve[n] if n <= sieve_size && (n % 12 == 1 || n % 12 == 5)
    end

    def apply_second_filter(sieve, sieve_size, x2, y2)
      n = x2 * 4 + y2 - x2
      sieve[n] = !sieve[n] if n <= sieve_size && n % 12 == 7
    end

    def apply_third_filter(sieve, sieve_size, x2, y2)
      n = x2 * 4 + y2 - x2 - 2 * y2
      sieve[n] = !sieve[n] if n <= sieve_size && n % 12 == 11
    end
  end
end
