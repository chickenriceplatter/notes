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
curl -XPUT "localhost:9200/index/type/id" -d ' { key: value } '
```

#### Retrieve document

```ruby
server.index(:index).type(:type).get(id)
```

```bash
curl -XGET "localhost:9200/index/type/id"
```

#### Delete document

```ruby
```

```bash
curl -XDELETE "http://localhost:9200/index/type/id" -d''
```

#### Search for document

```ruby
server.index(:states).type(:state).search(query: {match: {key: value}})
# => returns Stretcher::SearchResults object, call Stretcher::SearchResults#docs or Stretcher::SearchResults#documents method to get array of documents.
```

```bash
curl -XGET "localhost:9200/index/type/_search?q=key:value"
```


#### list all indices

```ruby
server.stats.indices.keys
```

#### list all types in an index

```ruby
server.index(:index).stats.indices.keys
```
