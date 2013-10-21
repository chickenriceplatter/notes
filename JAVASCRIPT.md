# Javascript Notes

#### Array

###### create new array

    var array = [1,2,3];

###### delete (does not remove element, only sets element to undefined)

    var array = [1,2,3];
    delete array[1]  # => [1,undefined,3]

###### length (returns array length)
    
    var array = [1,2,3];
    array.length  # => 3

###### pop (removes the last element at the end of array)

    var array = [1,2,3];
    array.pop()  # => [1,2]

###### push (adds an element to the end of the array)

    var array = [1,2,3];
    array.push(4)  # => [1,2,3,4]

###### shift (removes the first element of the array)

    var array = [1,2,3];
    array.shift()  # => [2,3]

###### unshift (adds an element to the beginning of the array)

    var array = [1,2,3];
    array.unshift(5)  # => [5,1,2,3]

#### Associative Arrays

###### use strings as indexes

    var hash = [];

    hash["first"] = "thing1";
    hash["second"] = "thing2";

length will only count the numbered indexes in an array

    hash.length  # => 0

+ for loops will only loop through number indexes.
+ for-in loops will loop through all indexes in an associative array.

#### Functions

###### Anonymous function (creating)

    var sayName = function(name){
        alert("Hi, " + name + "!");
    }

###### Named function (creating)

    function isEven(number) {
        return number % 2 === 0;
    }



