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
Ruby keyword that takes in a variable and returns a string of the kind of object, returns nil if the variable is not defined.

    something = 3
    defined?(something)  # => "local-variable"

#### File

###### File.size([file_name])
This method returns the size of a file.

    File.size("file_name.md")  # => 56

#### Hash

###### fetch(:key, default_value)
alternate way of getting a value from a hash, if the key does not exist, it returns the default value instead of nil

    hash = { key1: 1, key2: 2}
    hash.fetch(:key3, "something")  # => "something"

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

###### bytesize (returns number of bytes, this can be used for any object that has #to_s method)

    > string = "string"
    > string.bytesize  # => 6

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


----

# Standard Library

#### Benchmark

#### CSV

#### Fiber

#### JSON

    require 'json'

    serialized = data.to_json

    JSON.parse(serialized)

#### mathn

#### open-uri

#### pathname

#### pp

#### prime

    number = 50
    number.prime?  # => false

#### set

#### YAML
