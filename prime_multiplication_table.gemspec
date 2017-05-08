require File.expand_path('../lib/prime_multiplication_table/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'prime_multiplication_table'
  gem.version       = PrimeMultiplicationTable::VERSION
  gem.date          = '2017-05-08'
  gem.summary       = 'Prime multiplication table printer'
  gem.description   = 'Ruby gem for printing prime multiplication tables'
  gem.authors       = ['Konstantin Lynda']
  gem.email         = 'knlynda@gmail.com'
  gem.files         = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.require_paths = ['lib']
  gem.homepage      = 'http://rubygems.org/gems/prime_multiplication_table'
  gem.license       = 'MIT'
end
