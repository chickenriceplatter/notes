class Tree

  attr_reader :list

  def initialize(list)
    @list = list
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

  def longest_string
    list.map{ |each| each.to_s.size }.max
    # 2
  end

  def line_size
    number_of_elements = 2**(layers-1)
    number_of_elements * 4 - 1
  end

  def number_of_elements_in_row(row)
    2**(row - 1)
  end

  def in_between_spacing(row)
    return 0 if row == 1
    return 1 if row == layers

    number_of_elements = number_of_elements_in_row(row)

    (line_size - (number_of_elements + 1) * longest_string) / (number_of_elements + 2)
    # (line_size - number_of_elements * longest_string) / (number_of_elements + 1)
  end

  def print
    output = ""

    copy = list.clone

    (1..layers).each do |layer|
      slice_size = number_of_elements_in_row(layer)

      a = copy.slice!(0...slice_size)

      if a.size < slice_size
        diff = slice_size - a.size

        a = a + [" "]*diff
      end


      a.map!{ |each| each.to_s.center(longest_string) }
      if a.size == slice_size
        a.insert((slice_size / 2), "")
      end

      s = a.join(" " * in_between_spacing(layer))
      # if (a.size == slice_size) && (a.size != 1) && (layer != layers)
      #   s.insert((s.size / 2), " "  * (layers - layer - 1))
      # end
      s = s.center(line_size)
      s << "\n"

      output << s
    end
    puts output
  end

end
