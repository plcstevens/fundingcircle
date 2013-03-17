require "thor"
require_relative "fundingcircle/generate_tables"

module FundingCircle

  #This class registers the generate function, allowing users of the command line get help on how the method works
  #and allow for future classes and functionality to be added later.
  class Root < Thor
    register FundingCircle::GenerateTables,
             'generate',
             'generate [amount]',
             <<-eos
Amount indicates the number of primes numbers, the default is 10.

Produces a table of prime numbers as the first row and column, every subsequent row and column is the product of the matching first row and column primes.
eos
  end
end

# Immediately run this when called.
FundingCircle::Root.start
