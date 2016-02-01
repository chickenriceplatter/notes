JULIA
===

installation
---
download: http://julialang.org/downloads/

add the following to .bashrc:
  ```bash
  export JULIAPATH=/Applications/Julia-0.4.3.app/Contents/Resources/julia
  export PATH=$PATH:$JULIAPATH/bin
  ```

julia repl
---
```bash
$ julia # to open
julia> exit() # to exit
```

how to install packages
---
open julia repl
  ```bash
  julia> Pkg.add("[package_name]")
  ```

require package in script
---
  ```
  using [package_name]
  ```

julia files
---
julia files end in ```.jl```

```julia file_name.jl``` to run file

quirks
---
- indexes start at 1 instead of 0


dataframes
---
```
using DataFrames

df = readtable("path/to/files.csv")

any(isna(df[:column_name])) # check if any value in column is NA

in("some value", df[:column_name]) # check if specific value is in a column

length(unique(df[:column_name]) # show how many unique values are in column

df[(isna(df[:column_name])),:] # show all rows where value is NA for specific column

describe(df) # shows mean, unique values etc. for csv
```

datastructure
---
```
using DataStructures

counter(df[:column_name]) # show number of occurrences for each value
```
