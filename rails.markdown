Rails
===

new project (no test suite, postgresql)
---
```bash
$ rails new <app_name> -T --database=postgresql
```

Use ActiveRecord on a Table
---
```ruby
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "mysql2",
  :database => "[database_name_in_quotes]"
)

class [TableNameInCamelCaseSingular] < ActiveRecord::Base
end
```

#### Connect to multiple databases
```ruby
class [TableNameInCamelCaseSingular] < ActiveRecord::Base
  establish_connection(
    :adapter => "mysql2",
    :database => "[database_name_in_quotes]"
  )
end
```

#### Create a model on top of any existing table
```ruby
class [ModelName] < ActiveRecord::Base
  establish_connection(
    :adapter => "mysql2",
    :database => "[database_name]"
  )

  self.table_name = "[EXACT_TABLE_NAME_AS_IT_CURRENTLY_IS]"
end
```

#### Use ActiveRecord in memory only, no database
- https://gist.github.com/jaymcgavren/b6568588329d92c1ce5f719363688ad1
```ruby
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'memory'
)

ActiveRecord::Schema.define do
  create_table  "books", force: :cascade do |t|
    t.string    :title
    t.string    :author
    t.integer   :edition
    t.integer   :number_of_pages
    t.string    :genre
    t.string    :isbn
  end

  create_table "recipes", force: :cascade do |t|
    t.string    :name
    t.string    :type
    t.text      :ingredients, array: true
    t.text      :instructions
  end
end

class Book < ActiveRecord::Base
end

class Recipe < ActiveRecord::Base
  serialize :ingredients, Array
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
