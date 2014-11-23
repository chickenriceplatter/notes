Bundler
===

http://bundler.io/

Instead of requiring all of the gems in Gemfile
---
```ruby
require 'bundler/setup'
Bundler.require(:group_name, :default)
```

bundler commands
---

- **bundle init** - Creates Gemfile
- **bundle list** - shows list of gems in Gemfile.lock
- **bundle show** - alias for bundle list
- **bundle list [gem_name]** - shows location of gem
- **bundle open [gem_name]** - opens source code of gem in text editor
- **bundle viz** - creates a diagram of gem dependencies
