#!/usr/bin/env ruby

# Tested with ruby 3.0.2p107

#######################
#######  DAY 1  #######
#######################

# Print the string "Hello, world".
puts 'Hello, world.'

# For the string "Hello, Ruby", find the index of the word "Ruby".
# Using regex (returns nil if not found)
'Hello, Ruby' =~ /Ruby/
# Using index() (same as in python, returns nil if not found)
'Hello, Ruby'.index 'Ruby'


# Print your name ten times.
10 . times { puts "your name" } # ha

# Print the string "This is sentence number 1", where the number 1 changes from 1 to 10.
10 . times { |i| puts "This is sentence number #{i + 1}" }
#(1..10) . each { |i| puts "This is sentence number #{i}" }


# Bonus problem: write a program that picks a random number. Let a player guess the
# number, telling the player whether the guess is too low or too high.

puts '-' * 20  # Like in Python, but the String must come first.
puts 'Guess the number.'

n = rand(10)  # from 0 to 9.

#read_n = gets.chomp # to remove '\n' at the end
#read_n = gets.strip # remove all withespace from beginning and end
#read_n = gets.to_i  # and convert to integer (ignores leading whitespace and stops at the first non-digit char)

# Plain begin-end-while is not recommended for "do{} while();"-style loops.
# Source: https://rosettacode.org/wiki/Loops/Do-while#Ruby
# Let's keep Matz happy.
loop do
  print 'Type your guessed number: '
  read_n = gets.to_i

  puts "You guessed #{read_n}..."

  if read_n < n
    puts '...too low'
  elsif read_n > n
    puts '...too high'
  else
    raise "Impossible???" unless n == read_n
    puts '...you win !!1!', "(the number was #{n})"
    puts '-' * 20
    break
  end
end

#######################
#######  DAY 2  #######
#######################

## 1.1
# Print the contents of an array of sixteen numbers, four numbers
# at a time, using just each.
#
# Catalan numbers (https://oeis.org/A000108), because why not.
array = [1, 1, 2, 5, 14, 42, 132, 429, 1430, 4862, 16796, 58786, 208012, 742900, 2674440, 9694845]

count = 0
array.each do |n|
  print "#{n},"
  if count == 3
    count = 0
    puts
  else
    count += 1
  end
end


## 1.2
# Now, do the same with each_slice in Enumerable
array.each_slice(4) { |n_slice| p n_slice }


## 2
# The Tree class was interesting, but it did not allow you to specify
# a new tree with a clean user interface. Let the initializer accept a
# nested structure with hashes and arrays.
#
# You should be able to specify a tree like this:
# {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }

puts
puts '-' * 20
puts 'dump tree:'

class Tree
  attr_accessor :children, :node_name

  def initialize(hash)
     raise "Only one root node accepted" unless hash.keys.length == 1
     @node_name = hash.keys.first
     # Recurse
     @children = hash[@node_name].map { |k, v| Tree.new(k => v) }
  end

  # Rest of the class is the same.
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

hash = {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }

Tree.new(hash).visit_all { |n| puts n.node_name }

## 3
# Write a simple grep that will print the lines of a file having any
# occurrences of a phrase anywhere in that line. You will need to do
# a simple regular expression match and read lines from a file.
#
# (This is surprisingly simple in Ruby.) If you want, include line numbers.

def grep(file, re)
  file.each { |line| puts "#{file.lineno}:#{line}" if line.match? re }
  # Note: we could also use `line[re]` to get the matching text.
  # Source: https://ruby-doc.org/core-3.0.3/String.html#method-i-5B-5D
end

puts
puts '-' * 20
puts 'testing with regex /\b[Tt]ree\b/'

# Use this very file as input.
File.open(__FILE__, 'r') { |f| grep(f, /\b[Tt]ree\b/) }
puts '-' * 20

##
# This line and the next one should be printed as the whole word Tree is mentioned.
# But the next line has "trees" and not "tree"; hence, it shall not be printed.
# This one IS NOT printed as it only mentions trees, with an 's'.
##

#######################
#######  DAY 3  #######
#######################

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read(file)
      @headers = file.gets.chomp.split(', ')
      @headers = @headers.map(&:to_sym)  # Convert from Strings to Symbols

      @csv_contents = []
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize(filename = nil)
      filename = self.class.to_s.downcase + '.txt' if filename == nil
      #puts "reading from #{filename}..."
      File.open(filename) { |f| read(f) }
    end

    def each
      @csv_contents.each do |row_data|
        yield(CsvRow.new(@headers, row_data))
      end
    end
  end

end


class CsvRow
  def initialize(headers, row_data)
    # https://stackoverflow.com/a/3359681/2180200
    @data = Hash[headers.zip row_data]
  end

  def method_missing name, *args
    # unlike in the `Roman` example, this is an instance method!
    @data[name.to_sym]
  end
end


class RubyCsv
  include ActsAsCsv
  acts_as_csv
end


csv = RubyCsv.new
#puts csv.headers.inspect
#puts csv.csv_contents.inspect

puts 'read "one":'
csv.each {|row| puts row.one}
puts 'read "two":'
csv.each {|row| puts row.two}

