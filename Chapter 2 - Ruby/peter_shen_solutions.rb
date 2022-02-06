# Day one
# 1
puts 'Hello, world'

# 2
puts 'Hello, Ruby'.index 'Ruby'

# 3
for _ in 0..10
    puts 'Peter'
end

# 4
for i in 1..10
    puts "This is sentence number #{i}"
end

# bonus
key = rand(10)
loop do
  guess = gets.to_i
  if guess < key
    puts 'Go higher!'
  elsif guess > key
    puts 'Go lower!'
  else
    break
  end
end


# Day two
# File IO without code blocks
file = File.open "/tmp/ruby.test", "w"
file.puts "test"
file.close

# File IO with code blocks
# advantage because file closes at end of scope instead of when GC runs
# see: C v C++/Rust
File.open("/tmp/ruby.test", "r") do |f| 
  raise "Writing failed" unless f.read == "test\n"
end

# hash to array
hash = {"foo" => "bar", 0 => 1}
arr = hash.map {|k, v| [k, v]}
raise "#{arr} isn't right" unless arr == [["foo", "bar"], [0, 1]]
hash.keys
hash.values

# array to hash
raise "hash != arr" unless arr.to_h == hash

#iterate through hash
hash.each do |k, v|
  puts "#{k}: #{v}"
end

# each v each_slice
nums = (1..16).to_a
nums.each do |i|
  print "#{i} "
  print "\n" if i % 4 == 0
end

nums.each_slice(4) do |a|
  puts a.join " "
end

# hash-based Tree initializer
class Tree
  attr_accessor :children, :node_name

  def initialize(name, children={})
    @children = children.map {|k, v| Tree.new(k, v)}
    @node_name = name
  end

  def visit_all(&block)
    block.call self
    children.each {|c| c.visit_all &block}
  end
end

tree = Tree.new(1, {11 => {111 => {}, 101 => {}}, 10 => {111 => {}}})
tree.visit_all {|node| puts node.node_name}

# grep
def grep(regex, filename)
  File.open filename do |f|
    f.each_with_index do |line, i|
      puts "#{i + 1}: #{line}" if line.match regex
    end
  end
end

grep /unsafe/, "/tmp/args.rs"


# Day 3
module ActsAsCsv
    class CsvRow
        attr_accessor :row
        def method_missing(name, *args, &block)
            @row[name.to_s]
        end

        def initialize dict
            @row = dict
        end
    end

    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods
        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.csv'
            File.open filename do |file|
                @headers = file.gets.chomp.split(',')
                file.each do |row|
                    raise "Row is the wrong size: row of length #{row.length} != header of length #{@headers.length}" if row.length == @headers.length
                    @csv_contents << row.chomp.split(',')
                end
            end
        end

        attr_accessor :headers, :csv_contents

        def initialize
            read
        end

        def each(&block)
            @csv_contents.each do |row|
                block.call CsvRow.new @headers.zip(row).to_h
            end
        end
    end
end

class Ruby_Csv
    include ActsAsCsv
    acts_as_csv
end

csv = Ruby_Csv.new
csv.each do |row|
    puts row.h1
    puts row.h2
    puts row.h3
end
