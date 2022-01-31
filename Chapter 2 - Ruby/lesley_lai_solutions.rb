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
