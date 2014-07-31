redis
---

#### start server
```bash
$ redis-server
```

#### start commandline
```bash
$ redis-cli
```

#### change databases
```bash
redis 127.0.0.1:6379> select [whole number]
```

#### set data
```bash
set users:leto '{"name": "leto", "planet": "dune", "likes": ["spice"]}'
```

#### get data
```bash
get users:leto
```

#### erase db
```bash
flushdb
```
