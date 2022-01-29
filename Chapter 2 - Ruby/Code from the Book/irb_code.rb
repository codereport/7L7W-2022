# 2.2

>> properties = ['object oriend', 'duck typed', 'productive', 'fun']
=> ["object oriend", "duck typed", "productive", "fun"]

>> properties.each { |x| puts "Ruby is #{x}" }
# Ruby is object oriend
# Ruby is duck typed
# Ruby is productive
# Ruby is fun
=> ["object oriend", "duck typed", "productive", "fun"]

>> 4
=> 4
>> 4.class
=> Integer
>> 4.methods
=> [:bit_length, :digits, :|, :numerator, :gcd, :-@, :**, :<=>, :<<, :>>, :<=, :>=, :==, :===, ... ]
>> Integer.methods
=> [:sqrt, :allocate, :superclass, :<=>, :<=, :>=, :==, :===, :included_modules, :include?, ... ]
>> Integer.methods.sort
=> [:!, :!=, :!~, :<, :<=, :<=>, :==, :===, :=~, :>, :>=, :__id__, :__send__, :alias_method, ... ]
>> 4.methods.sort
=> [:!, :!=, :!~, :%, :&, :*, :**, :+, :+@, :-, :-@, :/, :<, :<<, :<=, :<=>, :==, :===, :=~, :>, ... ]

# 2.3

>> animals = ['lions','tigers','bears','red pandas']
=> ["lions", "tigers", "bears", "red pandas"]
>> puts animals
lions
tigers
bears
red pandas
=> nil
>> animals[0]
=> "lions"
>> animals[2]
=> "bears"
>> animals[10]
=> nil
>> animals[-1]
=> "red pandas"
>> animals[0..2]
=> ["lions", "tigers", "bears"]
>> (0..10).class
=> Range

>> a = []
=> []
>> a[2] = 'hi'
=> "hi"
>> a
=> [nil, nil, "hi"]

>> nums = { 1 => 'one', 2 => 'two' }
=> {1=>"one", 2=>"two"}
>> nums[1]
=> "one"

>> (1..5).collect { |x| x * 2 }
=> [2, 4, 6, 8, 10]
>> (1..5).select { |x| x > 2 }
=> [3, 4, 5]
>> (1..5).inject(0) { |a,b| a + b }
=> 15
>> (1..5).inject { |a,b| a + b }
=> 15
>> (1..5).inject( &:+ )
=> 15
>> (1..5).sum
=> 15
