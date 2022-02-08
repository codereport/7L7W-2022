search = '\scook\s'
text = "/home/agman/Downloads/cantebury_tales.txt"

class String
    def method_missing(name, *args, &block)
        colors = {
        :black => "\u001b[30m",
        :red => "\u001b[31m",
        :green => "\u001b[32m",
        :yellow => "\u001b[33m",
        :blue => "\u001b[34m",
        :magenta => "\u001b[35m",
        :cyan => "\u001b[36m",
        :white => "\u001b[37m",
        :bright_black => "\u001b[30;1m",
        :bright_red => "\u001b[31;1m",
        :bright_green => "\u001b[32;1m",
        :bright_yellow => "\u001b[33;1m",
        :bright_blue => "\u001b[34;1m",
        :bright_magenta => "\u001b[35;1m",
        :bright_cyan => "\u001b[36;1m",
        :bright_white => "\u001b[37;1m"}
        emphasises = {
        :bold => "\u001b[1m",
        :underline => "\u001b[4m",
        :reversed => "\u001b[7m"}
        reset = "\u001b[0m"
        if colors.has_key?(name) then
            emphasis = args.map{|a| emphasises[a.to_sym]}.join()
            colors[name]+emphasis+self+reset
        else
            super
        end
    end
end

count = 0
File.readlines(text).each_with_index do |line, index|
    if line =~ /#{search}/i then
        puts "#{index.to_s.green("reversed")}: #{line.gsub(/#{search}/i) { |match| "#{$&}".blue }}"
        count += 1
    end
end

puts "---------------------------------------------------------------"
puts "#{count.to_s.red(:underline)} lines matched #{search.red("underline")} in file #{text.red(:underline)}"


