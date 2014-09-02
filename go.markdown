golang
===

### show type
```go
import "reflect"

reflect.TypeOf(object)
```

### time execution
```go
import "time"

start := time.Now()
time.Since(start)
```

### string to integer conversion
```go
import "strconv"

// func ParseInt(s string, base int, bitSize int) (i int64, err error)

integer, _ := strconv.ParseInt("255", 10, 64)
```

### integer to string conversion
```go
import "strconv"

new_string := strconv.Itoa(255)
```

### read from file
```go
import "io/ioutil"

data, _ := ioutil.ReadFile("./file_name.txt")
```

---

### Install
```bash
$ brew install go
```

### execute program
```bash
$ go run file_name.go
```

===

types
---

#### basic types
- bool
- string
- int, int8, int16, int32, int64
- uint, uint8, uint16, uint32, uint64, uintptr
- byte(uint8)
- rune(int32), like a char
- float32, float64
- complex64, complex128

#### other types
- array
- slice
- struct
- pointer
- function
- interface
- map
- channel

#### Integers
- uint8
- uint16
- uint32
- uint64
- int8
- int16
- int32
- int64
- generally use **int**

#### floats
- float32
- float64
- generally use **float64**

#### booleans
- &&, for and
- ||, for or
- !, for not

#### variables
- declaration: var variable\_name variable\_type = value
```go
var x string = "hello world"
```
- shorthand
```go
x := "hello world"
```

- multiple initialization
```go
var a, b, c int = 1, 2, 3
```

#### scope
- Go is lexically scoped using blocks.

#### constants
- constants are declared using 'const' keyword

#### loops
- go only has for loops
```go
for i := 1; i <= 10; i++ {
  ...
}
```

#### if
```go
if condition {
  ...
} else
  ...
}
```

### switch
```go
switch i {
  case 0: fmt.Println("Zero")
  case 1: fmt.Println("One")
  case 2: fmt.Println("Two")
  default: fmt.Println("Unknown number")
}
```

#### arrays

- an array has a fixed length and contains elements of a single type

```go
var variable [size]type
var x [5]int

x := [5]float64{ 33.2, 33.3, 33.4, 33.5, 33.6 }
```

- len(array), returns length of array

#### slices
- slices can have variable lengths

```go
var x []float64

x := make([]float64, 5)
```

#### maps
- dictionary / associative array

```go
var x map[string]int

x := make(map[string]int)
x["key"] = 10
fmt.Println(x["key"])
```

- delete items

```go
delete(map, "key")
```

#### typecasting
- float64(int), converts int into float

#### functions
- definition

```go
func function_name(parameter\_name, parameter\_type) {
  ...
}
```

#### pointers
```go
var message string = "Hello!"
var message_pointer *string = &message
fmt.Println(message, message_pointer) //prints out message memory address
fmt.Println(message, *message_pointer) //prints out content of memory address
```
#### user defined types
