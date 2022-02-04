# Day 1

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
    case
    when guess < answer
      puts "Too low"
    when guess > answer
      puts "Too high"
    else
      puts "Right on"
      break
    end
  end
end.()
