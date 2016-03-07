# confie

Minimalistic settings for your Rails application

## Features

* super-simple
* loads YAML+ERB files
* reloads every time on `Object.send(:remove_const, :Settings)`
* uses [Hashie::Mash](http://www.rubydoc.info/github/intridea/hashie/Hashie/Mash)

## Installation

Add `gem 'confie'` in your Gemfile

## Usage

Accessing settings keys

```yml
# config/settings.yml
my:
  config_key1: "value"
  config_key2: [1, 2, 3]
other_key: 2
```

```ruby
Settings # #<Hashie::Mash my=#<Hashie::Mash config_key1="...>>
Settings.my.config_key1 # "value"
Settings.my.config_key2 # [1, 2, 3]
Settings.other_key # 2
# change yml file
Object.send(:remove_const, :Settings)
Settings.other_key # 3
```

## Files priority
Every next file overrides values from previous using deep merge
* `#{Rails.root}/settings.yml`
* `#{Rails.root}/settings.local.yml`
* `#{Rails.root}/settings/#{Rails.env}.yml`
* `#{Rails.root}/settings/#{Rails.env}.local.yml`

## Defining const

To redefine settings constant, e.g. `MyConfig`, create `my_config.rb` in your autoloaded directory
```ruby
# my_config.rb
MyConfig = Confie.load!

# then use it
MyConfig.my_key
```

## Extending existing module

```yml
# config/settings.yml
secret_key: "abcdef"
```

```ruby
module Twitter; end
Confie.extend!(Twitter)
Twitter.settings.secret_key # "abcdef"
```

## Reload every request in development mode
```ruby
# in config/initializers/
ActiveSupport::Dependencies.explicitly_unloadable_constants << 'Settings'
```
