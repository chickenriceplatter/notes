class Node

  attr_reader :key
  attr_accessor :next_node, :value

  def initialize(key, value)
    @key = key
    @value = value
  end

end

class LinkedList

  attr_accessor :head

  def append(node)
    node.next_node = head unless head.nil?
    self.head = node
  end

  def remove(key)
    return 'list is empty, nothing to remove' if head.nil?
    previous_node = nil
    current_node = head

    loop do
      if current_node.key == key
        value = current_node.value
        if previous_node.nil?
          self.head = current_node.next_node
          return value
        else
          previous_node.next_node = current_node.next_node
          return value
        end
      end
      previous_node = current_node
      current_node = current_node.next_node
      return "key '#{key}'' not found in list" if current_node.nil?
    end
  end

  def has_key?(key)
    current_node = head

    loop do
      return true if current_node.key == key
      return false if current_node.next_node.nil?
      current_node = current_node.next_node
    end
  end

  def get_value(key)
    return "key '#{key}' does not exist" unless has_key?(key)
    current_node = head

    loop do
      return current_node.value if current_node.key == key
      current_node = current_node.next_node
    end
  end

  def update_value(key, value)
    return "key '#{key}' does not exist" unless has_key?(key)
    current_node = head

    loop do
      if current_node.key == key
        current_node.value = value
        break
      end
      current_node = current_node.next_node
    end
  end

  def size
    return 0 if head.nil?
    count = 1
    current_node = head

    loop do
      current_node = current_node.next_node
      return count if current_node.nil?
      count +=1
    end
  end

end
