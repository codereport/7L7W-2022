module ActsAsCsv
    def self.included(base)         # apparently callback when this mod is included
        base.extend ClassMethods    # looks like target/receiving class extended with module ClassMethod
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods
        def read
            @csv_contents = []
            filename = self.class.to_s.downcase+'.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                @csv_contents << row.chomp.split(', ')
            end
        end

        attr_accessor :headers, :csv_contents

        def initialize
            read
        end
    end

    def each
        for item in @csv_contents do
            yield CsvRow.new(@headers, item)
        end
    end
end

module DynamicMembers
    def shape_class(header)
        for column in header do
            DynamicMembers::attr_accessor(column)           # can shape class by dyn named var
        end
    end
end

class CsvRow
include DynamicMembers                                      # clutter away from consumer class
    def initialize(header, row)
        shape_class(header)
        for i in 0..header.length-1 do
            # this class already shaped, can rely on members to exist
            instance_variable_set("@#{header[i]}", row[i])  # can set dyn named var
        end
    end

end

class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

puts 'testing ActsAsCsv'
csv = RubyCsv.new
puts csv.headers.inspect
puts csv.csv_contents.inspect

puts
puts 'testing CsvRow'
csv.each { |row| puts row.one }
puts
csv.each { |row| puts row.two }