puts "# Day 1"

# Quickies
puts "Hello, world"
puts "Hello, Ruby" =~ /Ruby/
10.times { puts "Tom" }
# I originally did `10.times` with `#{n + 1}` but changed after seeing Conor's
# and Lesley's and thinking about the previous request to study ranges.
(1..10).each { |n| puts "This is sentence number #{n}." }

# Guessing game
lambda do
  high = 10
  puts "Guess a number between 1 and #{high}:"
  answer = rand(1..high)
  loop do
    guess = gets.to_i
    puts case
      when guess < answer then "Too low"
      when guess > answer then "Too high"
      else break
      end
  end
  puts "Right on"
end # .() # uncomment to run


puts
puts "# Day 2"

# Eaches
lambda do
  vals = (1..16).to_a
  ncols = 4
  # Each
  vals.each.with_index do |val, index|
    print val
    print case
      when (index + 1) % ncols == 0 then "\n"
      else " "
      end
  end
  # Each slice
  vals.each_slice(ncols) do |vals|
    # TODO Better to iterate?
    puts vals.join(" ")
  end
end.()

# Tree
class Tree
  attr_accessor :children, :node_name

  def initialize(structure)
    raise unless structure.length == 1
    @node_name, value = structure.first
    @children = value.map do |key, value|
      Tree.new({ key => value })
    end
  end

  def visit_all(depth: 0, &block)
    visit(depth:, &block)
    children.each { |c| c.visit_all(depth: depth + 1, &block) }
  end

  def visit(depth: 0)
    yield(self, depth:)
  end
end

lambda do
  tree = Tree.new({ "grandpa" => {
    "dad" => { "child 1" => {}, "child 2" => {} },
    "uncle" => { "child 3" => {}, "child 4" => {} },
  } })
  tree.visit_all do |node, depth:|
    print "  " * depth
    puts node.node_name
  end
end.()

# Grep
lambda do
  puts("## Matches")
  phrase = /visit/
  # Follow reminder from Lesley to close file with block.
  File.open(__FILE__) do |file|
    file.each_with_index do |line, index|
      puts("#{index + 1}: #{line}") if line =~ phrase
    end
  end
end.()


puts
puts "# Day 3"

# Csv
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
    attr_accessor :headers, :csv_contents

    def initialize(headers, csv_contents)
      @headers = headers
      @csv_contents = csv_contents
    end

    def each
      @csv_contents.each do |values|
        yield CsvRow.new(Hash[@headers.zip(values)])
      end
    end
  end
end

class CsvRow
  def initialize(hash)
    @hash = hash
  end

  def method_missing(name)
    @hash[name.to_s]
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

lambda do
  csv = RubyCsv.new(["one", "two"], [["lions", "tigers"]])
  csv.each { |row| puts row.one }
end.()
