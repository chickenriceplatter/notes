require 'pry'
require 'digest/murmurhash'

require_relative 'linked_list'

class HashTable

  attr_reader :table

  def initialize
    @table = Array.new(10)
  end

  def bucket(key)
    Digest::MurmurHash1.rawdigest(key.to_s) % 10
  end

  def size
    count = 0

    table.each do |list|
      next if list.nil?
      count += list.size
    end
    count
  end

  def delete(key)
    return "invalid key" if table[bucket(key)].nil?

    if table[bucket(key)].has_key?(key)
      table[bucket(key)].remove(key)
    else
      "invalid key"
    end
  end

  def [](key)
    list = table[bucket(key)]
    return nil if list.nil?

    list.get_value(key)
  end

  def []=(key, value)
    if table[bucket(key)].nil?
      table[bucket(key)] = LinkedList.new
      node = Node.new(key, value)
      table[bucket(key)].append(node)
    else
      if table[bucket(key)].has_key?(key)
        table[bucket(key)].update_value(key, value)
      else
        node = Node.new(key, value)
        table[bucket(key)].append(node)
      end
    end
  end

end

h = HashTable.new

h['cheese'] = 'cake'
h['hot'] = 'dog'
h['apple'] = 'pie'
h['bread'] = 'butter'
h['key'] = 'value'
h['foo'] = 'bar'
h['ipsum'] = 'lorem'

binding.pry
