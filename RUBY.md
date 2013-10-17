# Ruby Notes

#### Array

###### & (intersection of 2 arrays)
    array1 = [1,2,3,4,5]
    array2 = [5,6,7,8,9]

    array1 & array2  # => [5]

###### | (union of 2 arrays)
    array1 = [1,2,3,4,5]
    array2 = [5,6,7,8,9]

    array1 | array2  # => [1,2,3,4,5,6,7,8,9]

#### defined?(variable)
+ Ruby keyword that takes in a variable and returns a string of the kind of object, returns nil if the variable is not defined.

    something = 3

    defined?(something)  # => "local-variable"

#### File

###### File.size([file_name])
This method returns the size of a file.

    File.size("file_name.md")  # => 56


#### Prime library
###### adds methods to Interger class

    require 'prime'

    integer = 2
    integer.prime?  # => True

    number = 9
    number.prime?  # => False

#### Range

###### 2 dots (inclusive of end of range)

    > (1..5).to_a  # => [1,2,3,4,5]

###### 3 dots (exclusive of end of range)

    > (1...5).to_a  # => [1,2,3,4]

#### String

###### substring (using range)

    > string = "string"
    > string[2..-1]  # => "ring"

#### Symbols

###### Symbol#id2name (alias of Symbol#to_s)
    > sym = :symbol
    > sym.id2name  # => "symbol"

###### String#intern (alias of String#to_sym)
    > string = "string"
    > string.intern  # => :string 