python
---

#### start/stop virtualenv
```bash
$ cd [into folder holding venv]
$ source venv/bin/activate
$ deactivate
```

#### start ipython notebook
```bash
$ ipython notebook
```

show length of string or list
---
```python
len(string)
len(list)
```

get object type
---
```python
type(object)
```

read file as string
---
```python
file = open("file.suffix", "r")
file.read()
file.close()
```

convert case
---
```python
string.upper()
string.lower()
```

map function
---
```python
array = map(lambda x: x**2, array)
```

reduce function
---
```python
def add(x,y):
  return x+y

reduce(add, range(1, 10))
```
