mongodb
---

#### install
```bash
$ brew install mongodb
```

#### start server
```bash
$ mongod
```

#### start shell
```bash
$ mongo
```

#### Basic commands
```
> show dbs
> show databases
> use [db_name]
> show collections //prints a list of all collections for current database.
> db.getCollectionNames()  // same as show getCollectionNames
> show users //prints a list of useres for current database
> show profile
> db.help()
> db.stats()
```

#### find documents
```
> use [database_name]
> db.[database_name].find()
```

#### Look at indexes
```
> use [database_name]
> db.system.indexes.find()
```

#### Inserting data
```
> use [database_name]
> db.[database_name].insert([hash])
```
