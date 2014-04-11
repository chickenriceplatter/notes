Rails
===

Using ActiveRecord on a Table
---

```ruby
ActiveRecord::Base.establish_connection
(
  :adapter => "mysql2",
  :database => "[database_name_in_quotes]"
)
end

Class [TableNameInCamelCaseSingular] < ActiveRecord::Base
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
