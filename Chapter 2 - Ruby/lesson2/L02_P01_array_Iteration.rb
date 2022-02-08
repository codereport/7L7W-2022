ar = *(1..16)
puts 'Source array'
puts ar.to_s
puts

for i in (0..15).step(4) do
    slice = ar[i .. i + 3]
    puts "batch starting at index #{i} is #{slice}"
end

puts "\nThe same from Enumerable .each_slice"

ar.each_slice(4) { |slice| puts "batch starting at index #{i} is #{slice}" }