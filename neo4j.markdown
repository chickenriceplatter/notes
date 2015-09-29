neo4j
===

install (osx)
---
```bash
$ brew install neo4j
```

start/stop server
---
```bash
$ neo4j start
$ neo4j stop
```

web interfaces
---
```
http://localhost:7474/browser/
http://localhost:7474/webadmin/
```

databases
---
There is only 1 database, to drop it and recreate it

```bash
$ neo4j stop
$ rm -rf /usr/local/Cellar/neo4j/2.2.5/libexec/data/graph.db
$ neo4j start
```

cypher
===
[] square brackets denote substituting with actual values (remove the square brackets when you substitute)

create node
---
```
CREATE (n:[label_name] {[hash_of_properties]});
e.g. CREATE(n:first_node {name:'starting point'});
```

add label to node
---
```
START n=node([id]) set n :[label] return n;
e.g. START n=node(0) set n :starting_node return n;
```

add property to node
---
```
START n=node([id]) set n.[key] = '[value]' return n;
e.g. START n=node(3) set n.name = 'foo' return n;
```

add relationship between 2 existing nodes
---
```
START first = node(1), second = node(2)
CREATE first-[r:[label of relationship] {[hash_of_relationship_properties]}]->second
return r;
```

match relationship(s) starting at node of interest
---
```
start n=node([id]) match n-[r]->() return r;
```

match relationship(s) ending at node of interest
---
```
start n=node([id]) match ()-[r]->n return r;
```

add property to relationship
---
```
start n=node([id]) match n-[r]->()
r.name = 'something'
return r;
```

return all nodes
---
```
match n return n;
```

delete all nodes
---
```
MATCH (n) OPTIONAL MATCH (n)-[r]-() DELETE n,r;
```

find node by id
---
```
START n=node([id]) return n;
```

find node id
---
```
match n where [condition] return ID(n);
```
