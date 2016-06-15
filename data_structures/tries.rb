require 'pry'

class Node

  def self.attr_list
    ("a".."z").to_a
  end

  attr_accessor *attr_list, :key, :value

end

class TrieHash

  attr_reader :root

  def initialize
    @root = Node.new
  end

  def [](key)
    current_node = root
    key.downcase.chars.each do |char|
      return nil if current_node.send(char).nil?

      current_node = current_node.send(char)
    end
    current_node.value
  end

  def []=(key,value)
    current_node = root

    key.downcase.chars.each do |char|
      if current_node.send(char).nil?
        current_node.send("#{char}=",Node.new)
        current_node = current_node.send(char)
      else
        current_node = current_node.send(char)
      end
    end
    current_node.key = key
    current_node.value = value
  end

  def keys
    output = []
    queue = [root]

    while !queue.empty?
      current_node = queue.shift
      ("a".."z").each do |letter|
        unless current_node.send(letter).nil?
          queue << current_node.send(letter)
          unless current_node.send(letter).key.nil?
            output << current_node.send(letter).key
          end
        end
      end
    end
    output.sort
  end

  def values
    output = []
    queue = [root]

    while !queue.empty?
      current_node = queue.shift
      ("a".."z").each do |letter|
        unless current_node.send(letter).nil?
          queue << current_node.send(letter)
          unless current_node.send(letter).value.nil?
            output << current_node.send(letter).value
          end
        end
      end
    end
    output.sort
  end

end

t = TrieHash.new

t['a'] = 'apple'
t['apple'] = 'pie'
t['bread'] = 'butter'
t['peanut'] = 'butter'
t['sugar'] = 'cookie'

binding.pry
