require "thor"
require "thor/group"
require 'terminal-table'

module FundingCircle

  # This takes in an numeric value or defaults to 10. It then produces that many prime numbers, and creates
  # a two dimensional array of the prime numbers and their products. This is then passed to a terminal table
  # gem which outputs the array in a terminal friendly table format.
  class GenerateTables < Thor::Group
    argument :amount,
             type: :numeric,
             desc: "The amount of prime numbers",
             default: 10

    desc "Generate a table of prime numbers based on the amount provided in the command line arguments"
    def generate_table
      # first get the amount of prime numbers requested (amount is either 10 or whatever the user requests)
      prime_numbers = generate_prime_numbers(amount)

      # then produce a two dimensional array of the values as the first row and first entry in every column
      table_data = generate_multi_array(prime_numbers)

      # take these tables and output them to the terminal
      p Terminal::Table.new :rows => table_data
    end

    private

    # Given an array of prime numbers, will return a multi dimensional array of the values as the first
    # column and row entry, and the remainder will be the product of that column and row entry.
    #
    # Example:
    # If you had a prime_number array of [2, 3] it would produce the following output
    # [["", 2, 3], [2, 4, 6], [3, 6, 9]]
    # @param [Array] prime_numbers an array of prime numbers
    # @return [Array] A multi dimensional array of the prime numbers and their products,
    def generate_multi_array prime_numbers
      return prime_numbers if prime_numbers.empty?
      # each row starts with the prime number, and all its products afterwards
      rows = prime_numbers.map do |prime|
        [prime, *prime_numbers.collect { |p| prime * p }]
      end
      # add the prime numbers to the first row, adding nil to the front
      rows.unshift(prime_numbers.unshift(nil))
    end

    # Given the amount requested, generate that many prime numbers in an array and return it
    # @param [Numeric] amount of prime numbers to return
    # @@return [Array] an array of prime numbers
    def generate_prime_numbers amount
      primes = []
      x = 0
      # until we have as many primes as requested keep searching
      until primes.length == amount
        x = next_prime(x)
        primes << x
      end
      primes
    end

    # Given the number, calculate and return the next prime number
    # @param [Numeric] current number to start searching from
    # @return [Numeric] the next prime number from the current
    def next_prime current
      n = current + 1
      n += 1 until is_prime? n
      n
    end

    # Checks if the number is prime by checking all numbers up to its square root value to see if
    # it is a factor of the number.
    # @param [Numeric] Number to spec if it is a prime
    # @@return [Boolean] True only if the number if a prime
    def is_prime? n
      return false if n <= 1
      (2..Math.sqrt(n)).each do |value|
        return false if n % value == 0
      end
      true
    end

  end

end
