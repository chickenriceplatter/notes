require 'pry'

class Heap

  attr_reader :list
  attr_accessor :current_position

  def initialize
    @list = []
  end

  def current_value
    list[current_position]
  end

  def left_child_position
    current_position + 1
  end

  def right_child_position
    current_position + 2
  end

  def left_child_value
    list[left_child_position]
  end

  def right_child_value
    list[right_child_position]
  end

  def largest_child_position
    return nil if left_child_value.nil? && right_child_value.nil?
    return left_child_position if right_child_value.nil?
    return right_child_position if left_child_value.nil?
    if left_child_value > right_child_value
      left_child_position
    else
      right_child_position
    end
  end

  def largest_child_value
    list[largest_child_position]
  end

  def parent_position
    if current_position % 2 == 0
      current_position / 2 -1
    else
      current_position / 2
    end
  end

  def parent_value
    list[parent_position]
  end

  def swap_positions(parent_position, child_position)
    list[parent_position], list[child_position] = list[child_position], list[parent_position]
  end

  def insert(value)
    list << value
    self.current_position = list.size - 1
    loop do
      break if current_position == 0

      if current_value > parent_value
        swap_positions(parent_position, current_position)
      end
      self.current_position = parent_position
    end
  end

  def remove
    list.shift
    list.unshift(list.pop)

    self.current_position = 0
    loop do
      break if largest_child_position.nil?

      if current_value < largest_child_value
        puts current_position
        # puts current_value
        p list
        temp = largest_child_position
        swap_positions(current_position, largest_child_position)
        self.current_position = temp
      else
        break
      end
    end
  end

  def layers
    number_of_elements = list.size
    total = 0

    while number_of_elements > 0
      number_of_elements -= 2**total
      total += 1
    end
    total
  end

  def print
    space = 7

    spacing = 3

    max_elements = 2**(layers - 1)

    line_size = (max_elements * 2 - 1)*spacing

    output = ""

    index = 0

    1.upto(layers) do |number|
      array = []
      (2**(number-1)).times do
        if list[index]
          s = list[index].to_s
          if s.size == 1
            s = " " + s
          end
          array << s
        else
          array << "  "
        end
        index += 1
      end

      string = array.join(" "*(2**(layers-number)))
      string = string.center(line_size)
      string << "\n"
      output << string
    end
    puts output
  end

end

h = Heap.new

(1..20).each do |n|
  h.insert(n)
end


binding.pry
