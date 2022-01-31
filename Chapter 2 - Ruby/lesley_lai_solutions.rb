# Day 1

# Print the string “Hello, world.”
puts "Hello, world."

# For the string “Hello, Ruby,” find the index of the word “Ruby.”
puts "Hello, Ruby,".index('Ruby')

# Print your name ten times.
10.times do
    puts "Lesley Lai"
end

# Print the string “This is sentence number 1,” where the number 1 changes from 1 to 10.
(1..10).each {|i| puts "This is sentence number %d" % i }

# Run a Ruby program from a file.
# This is a file

# Bonus problem: If you’re feeling the need for a little more, write a program 
# that picks a random number. Let a player guess the number,
# telling the player whether the guess is too low or too high.
# (Hint: rand(10) will generate a random number from 0 to 9, and gets will
# read a string from the keyboard that you can translate to an integer.)

target = rand(1..10)

puts "Number guessing game (from 1 to 10)"
while true
    print "Please input a number: "
    guess = $stdin.gets.to_i
    if guess < target then
        puts "Too low"    
    elsif guess > target then
        puts "Too high"
    else
        puts "You win"
        break
    end
end

# Print the contents of an array of sixteen numbers, four numbers at a
# time, using just each. Now, do the same with each_slice in Enumerable.
arr = (0..15).to_a
i = 0
arr.each do
    |v| if v % 4 == 3 then
        print "%d\n" % v
    else
        print "%d, " % v
    end
    i += 1
end

arr.each_slice(4) { |v| p v }

# The Tree class was interesting, but it did not allow you to specify a new
# tree with a clean user interface. Let the initializer accept a nested
# structure of hashes. You should be able to specify a tree like this:
# {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {},
# 'child 4' => {} } } }.
class Tree
    attr_accessor :children, :node_name
    def initialize(hashes)
        @node_name = hashes.keys[0]
        @children = hashes.values[0].map do |k, v|
             Tree.new({k => v})
        end
    end
    
    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

ruby_tree = Tree.new( {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } } )
ruby_tree.visit_all { |node| puts node.node_name }

# Write a simple grep that will print the lines of a file having any occurrences
# of a phrase anywhere in that line. You will need to do a simple
# regular expression match and read lines from a file. (This is surprisingly
# simple in Ruby.) If you want, include line numbers.

def grep(filename, str)
    File.open(filename) do |file|
        file.each_line
            .each_with_index
            .select { |line, _| line.include?(str) }
            .each {|line, i| puts "%d %s" % [i, line]}
    end
end

grep("lesley_lai_solutions.rb", "tree")