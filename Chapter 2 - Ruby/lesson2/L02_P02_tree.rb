# > ruby L02_P02_tree.rb

class Tree
    attr_accessor :children, :node_name

    def initialize(hash)

        key = hash.keys[0]
        @node_name = key

        hash_children = hash[key]

        @children = []
        return if hash_children.length == 0

        hash_children.each do |key, value| 
            child = Tree.new( { key => value} )
            @children.push(child)
            end
    end

    def visit_all
        puts "visiting #{@node_name}"
        @children.each { |child| child.visit_all }
    end
end    

tree = Tree.new({
    'grandpa' => {
        'dad' => {
        'child 1' => {}, 
        'child2' => {} }, 
    'uncle' => {
        'child 3' => {}, 
        'child 4' => {} } } })

tree.visit_all