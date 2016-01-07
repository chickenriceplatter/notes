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

run a python script
---
```bash
./bin/spark-submit my_script.py
```

create SparkContext
---
```python
rom pyspark import SparkConf, SparkContext

conf = SparkConf().setMaster("local").setAppName("My App")
sc = SparkContext(conf = conf)
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

getting headers line
---
```python
headers = lines.first()
```

ignoring headers line
---
```python
data = lines.filter(lambda x: x != headers)
```

getting single column from csv
---
```python
column = data.map(lambda line: line.split(",")[0])
```

write to file
---
```python
result.saveAsTextFile(outputFile)
```

reading csv as dataframe
---
```bash
$ IPYTHON=1 ./bin/pyspark --packages com.databricks:spark-csv_2.11:1.3.0
```

```python
df = sqlContext.read.format('com.databricks.spark.csv').options(header='true', inferschema='true').load('file_name.csv')
```

convert spark dataframe to pandas dataframe
---
```python
import pandas as pd

pandas_df = pd.DataFrame.from_records(spark_dataframe.collect(), columns=spark_dataframe.columns)
```

pandas dataframe write to disk as csv
---
```python
header = ["custom","list","of","header"]

df.to_csv('output.csv', columns = header)
```

spark read table from postgresql
---
```bash
$ IPYTHON=1 ./bin/pyspark --conf spark.executor.extraClassPath=/path/to/postgresql-9.4.1207.jar --driver-class-path /path/to/postgresql-9.4.1207.jar --jars /path/to/postgresql-9.4.1207.jar
```

```python
df = sqlContext.read.format('jdbc').options(url='jdbc:postgresql://localhost:5432/[database_name]?user=[username]&password=[password]', dbtable='[table_name]').load()
```

