# Print the string "Hello, world."
puts 'Hello, world.'


# ... find the index of the word "Ruby."
message = 'Hello, Ruby'
puts "The index of 'Ruby' in #{message} is: #{message.index('Ruby')}"


# Print your name ten times.
(1..10).each do
  puts "Michael"
end


# Method that substitutes part of a string
puts 'Hello, world'.sub('Hello', 'Lookout')


# Numbered sentences
for i in 1..10
  puts "This is sentence #{i}"
end


# Run a program from a file
# ruby <filename>


# 16 nums 4 at a time each
(1..16).each do | i |
  if (i % 4 == 0)
    puts i
  else
    print i
    print ' '
  end
end


# Same with each_slice
(1..16).each_slice(4) do | slice |
  slice.each do |i|
    print i.to_s + ' '
  end
  puts
end


# Guessing game
greater = Proc.new {|guess| guess > number}
less_than = Proc.new {|guess| guess < number}


def solicit_guess
  puts "Please enter a guess from 0 - 99"
  while true
    number = gets
    begin
      return number.to_i
    rescue
      puts "Your number was not an integer, please pick again."
    end
  end
end


def guessing_game
  target = rand(100)
  guess = -1
  i = 1
  until guess.to_i == number
    guess = solicit_guess
    case guess.to_i
    when greater
      puts "Your answer is too large"
    when less
      puts "Your answer is too small"
    else
      puts "You've guess it in #{i} attempts!"
    end
    i = i + 1
  end
end


# Ruby grep
pattern, filename = ARGV
File.open(filename) do |f|
  re_pattern = Regexp.new pattern
  f.readlines.each do |line|
    if line.match(re_pattern)
      puts line
    end
  end
end

