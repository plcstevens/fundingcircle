# Fundingcircle

This is a command line program that will produce prime number
table with the product of the primes in a table format.

## Steps to completing this task.

I approached this first by breaking it into the main parts,
  1. Commandline program
  2. Calculating the prime numbers
  3. Producing a table output
  4. Test the behaviour is accurate

For the first issue, I had used Thor in the past for minor commandline actions, and it felt the best choice here
for future scalability and behaviour.

For calculating the prime numbers, used a very basic way that merely checks nothing between 2 and the square root
of the number in question is a factor of the number. Taking these and producing a two dimensional array was the next
task.

The table output was done by researching possible libraries that could produce these for me, of which the best was
terminal-table in terms of the how it expected the data to be provided and how it looked.

Finally I used rspec to test the behaviour of the functions I used to create the table, checking each correctly
gave back prime numbers, correct types and same output when given the same input.

## Installation

Once you have unzipped this directory you should run 

    bundle

To install the required gems (thor and terminal-table).

## Usage

Once you have done this you can run the program by typing this from
the main folder of the program.

    bundle exec ruby ./lib/fundingcircle.rb

This will give you a list of possible functions.    

    bundle exec ruby ./lib/fundingcircle.rb generate   

This will use the default value of 10 to produce a table of the first
10 prime numbers, and their products.

    bundle exec ruby ./lib/fundingcircle.rb generate 15

You can also supply any numeric value (integer > -1) and it will produce
a table of that many prime numbers for you.

There are also a number of rspec tests included in this project that can
be run by typing

    rspec

From the main library folder.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
