class CsvRow
    def initialize(row, headers)
        @row = row
        @headers = headers
    end

    def method_missing(name)
        @row[@headers.index(name.to_s)]
    end
end

class ActsAsCsv
    def read
        file = File.new(self.class.to_s.downcase + '.csv' )
        @headers = file.gets.chomp.split(', ' )
    
        file.each do |row|
            @result << row.chomp.split(', ' )
        end
    end
    
    def headers
        @headers
    end

    def csv_contents
        @result
    end

    def initialize
        @result = []
        read
    end

    def each(&block)
        @result.each do |row|
            block.call CsvRow.new(row, @headers)
        end
    end
end

class RubyCsv < ActsAsCsv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each { |row| puts row.one }
