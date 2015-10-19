apache spark
===

start shell
---
```bash
./bin/pyspark
```

start IPython shell
---
```bash
IPYTHON=1 ./bin/pyspark
```

create rdd
---
```python
object = [1,2,3,4,5]
example = sc.parallelize(object)
```

reading from a file
---
```python
lines = sc.textFile("/path/to/file.suffix") # sc stands for spark context
```

write to file
---
```python
result.saveAsTextFile(outputFile)
```
