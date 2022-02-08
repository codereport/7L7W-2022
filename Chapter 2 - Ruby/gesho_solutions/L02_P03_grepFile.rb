# run by
# ruby L02_P03_grepFile.rb textSource.txt os

def ggrep(fileName, pattern)
    line_number = 0
    File.readlines(fileName).each do |line| 
        line_number += 1
        reg = Regexp.new(pattern)
        puts "on line #{line_number}: #{line.gsub!(pattern, high_light(pattern))}\n" if line =~ reg
    end
end

def high_light(text)
    colorEscape = 27.chr
    startGreen = "#{colorEscape}[32m"
    resumeRegular ="#{colorEscape}[0m"
    return startGreen+text+resumeRegular
end


if ARGV.length != 2
    then 
    puts "expext two args: fileName, pattern"
    puts 'eg ruby L02_P03_grepFile.rb textSource.txt non-Posix'
    return
end

fileName = ARGV[0]
pattern = ARGV[1]

puts
puts "searching pattern '#{high_light pattern}' in file '#{high_light fileName}'"
puts

ggrep(fileName, pattern)
