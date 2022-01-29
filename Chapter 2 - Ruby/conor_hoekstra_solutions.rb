# Day 1 Self Study

# 1. Print the string “Hello, world.”
puts 'Hello, world.'

# 2. For the string “Hello, Ruby,” find the index of the word “Ruby.”
puts "Hello, Ruby,".index('Ruby') # 7

# Cute trick
# >> "string".methods.filter { |x| x.to_s.include?('index') }
# => [:index, :rindex]
# >> "string".methods.filter { |x| x.to_s.include?('find') }
# => []

# 3. Print your name ten times.
puts "Conor Hoekstra\n" * 10

# 4. Print the string “This is sentence number 1,” where the number 1 changes from 1 to 10.
(1..10).each { |i| puts "This is sentence number #{i},\n" }

# 5. Run a Ruby program from a file.
# ruby conor_hoekstra_solutions.rb

# 6. Bonus problem: If you’re feeling the need for a little more, write a program that picks a random number. Let a player guess the number, telling the player whether the guess is too low or too high. (Hint: rand(10) will generate a random number from 0 to 9, and gets will read a string from the keyboard that you can translate to an integer.)

def guessing_game
    target = rand(100) + 1
    puts 'Please guess a number between 1 and 100:'
    guess = gets.chomp.to_i

    total_guesses = 1
    until guess == target
        if guess > target
            puts 'Your guess was too high'
        else
            puts 'Your guess was too low'
        end
        puts 'Please guess again:'
        guess = gets.chomp.to_i
        total_guesses += 1
    end

    puts "Amazing, you guessed #{target} in #{total_guesses} tries!"
end

# Day 2 Self Study

# 1. Print the contents of an array of sixteen numbers, four numbers at a time, using just each. Now, do the same with each_slice in Enumerable.
(1..16).each_slice(4) { |x| p x }

# 2. The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface. Let the initializer accept a nested structure with hashes and arrays. You should be able to specify a tree like this: {’grandpa’ => { ’dad’ => {’child 1’ => {}, ’child 2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }.

# Skip :)

# 3. Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line. You will need to do a simple regular expression match and read lines from a file. (This is surprisingly simple in Ruby.) If you want, include line numbers.
puts File.open('conor_hoekstra_solutions.rb')
         .each_line
         .select { |line| line.include?('puts') }

puts File.open('conor_hoekstra_solutions.rb')
         .each_line
         .each_with_index
         .select { |line, i| line.include?('puts') }
         .collect { |line, i| i.to_s.ljust(4, ' ') + line.gsub(' ','-') }

# Day 3 Self Study

class ActsAsCsv
    
    # ...

    # Add this 
    def each(&block)
        @result.each do |row|
            block.call CsvRow.new(row, @headers)
        end
    end
end

class CsvRow
    def initialize(row, headers)
        @row = row
        @headers = headers
    end

    def method_missing(name)
        @row[@headers.index(name.to_s)]
    end
end

# Test code
csv = RubyCsv.new
csv.each { |row| puts row.one }

# lions
# llamas
