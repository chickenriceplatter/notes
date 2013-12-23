# elasticsearch cheatsheet

### for all examples:

```ruby
server = Stretcher::Server.new('http://localhost:9200')
```

#### list all indices

```ruby
server.stats.indices.keys
```

#### list all types in an index

```ruby
server.index(:index).stats.indices.keys
```
