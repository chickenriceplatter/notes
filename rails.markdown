Rails
===

Using ActiveRecord on a Table
---

```ruby
ActiveRecord::Base.establish_connection(
  :adapter => "mysql2",
  :database => "[database_name_in_quotes]"
)

class [TableNameInCamelCaseSingular] < ActiveRecord::Base
end
```

#### Connecting to multiple databases

```ruby
Class [TableNameInCamelCaseSingular] < ActiveRecord::Base
  establish_connection(
    :adapter => "mysql2",
    :database => "[database_name_in_quotes]"
  )
end
```

#### Creating a model on top of any existing table

```ruby
class [ModelName] < ActiveRecord::Base
  establish_connection(
    :adapter => "mysql2",
    :database => "[database_name]"
  )

  self.table_name = "[EXACT_TABLE_NAME_AS_IT_CURRENTLY_IS]"
end
```

Arel
---
http://blog.bigbinary.com/2013/07/01/preload-vs-eager-load-vs-joins-vs-includes.html


database.yml
---

### mysql

```yaml
common: &common
  adapter: mysql2
  encoding: utf8
  reconnect: false
  pool: 5
  username: root
  socket: /tmp/mysql.sock

development:
  <<: *common
  database: project_name_development

test:
  <<: *common
  database: project_name_test
```
