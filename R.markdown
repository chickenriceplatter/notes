R
===

### connect to mysql and select table as dataframe
```bash
install.packages('RMySQL', repos='http://cran.us.r-project.org')

library(RMySQL)

mydb = dbConnect(MySQL(), user='root', password='', dbname='hockey', host='localhost')
rs = dbSendQuery(mydb, "select * from players")
data = fetch(rs, n=-1)

class(data)

players <- table(data$age)
barplot(players)
```


#### number of rows
NROW(dataframe_name)

#### operators
- ^, exponentation
- %%, modulus
- =, assignment

#### boolean values
- TRUE
- FALSE

#### checking data type
- class(variable_name)

#### vectors (are 1-dimensional arrays)
- variable_name = c(item1, item2, item3)
  - naming vectors
    -names(vector_name) = c(item1_name, item2_name, item3_name)

#### matrix
- variable_name = matrix(1:9,byrow=TRUE,nrow=3)

#### factors

#### dataframes
vector_1 = c(item1, item2, item3)
vector_2 = c(element1, element2, element3)
vector_3 = c(object1, object2, object3)

data_frame = data.frame(vector_1, vector_2, vector_3)

#### show dimension of dataframe
- dim(data_frame_name)

#### show names of columns of dataframe
- names(data_frame_name)


#### draw boxplot
- boxplot(dataframe$column_name)

#### summary of column
- summary(dataframe$column_name)


