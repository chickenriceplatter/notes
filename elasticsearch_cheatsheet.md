# elasticsearch cheatsheet

### for all examples:

```ruby
server = Stretcher::Server.new('http://localhost:9200')
```

#### Add Document

```ruby
server.index(:index).type(:type).put(id, hash)
```

```bash
curl -XPUT localhost:9200/index/type/id -d ' { key: value } '
```

#### Retrieve document

```ruby
server.index(:index).type(:type).get(id)
```

```bash
curl -XGET localhost:9200/index/type/id
```

#### list all indices

```ruby
server.stats.indices.keys
```

#### list all types in an index

```ruby
server.index(:index).stats.indices.keys
```
