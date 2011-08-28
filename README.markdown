# JSONObject

* http://github.com/sprysoft/json_object

## Description

JSONObject is a simple Ruby library for converting JSON objects into Ruby classes. 

It:

1. Simplifies parsing JSON objects into classes

2. Creates a series of setters, getters with instance variables for your new classes

## An Introduction

### Installation

Installation could be simpler but lets be honest it's not difficult

    gem 'json_object'

or

    gem install json_object


### Examples

Once you have the gem installed crack open an IRB session:

```ruby
require 'json_object'

json = '{ "first_name" : "David", "last_name" : "White" }'

obj = JSONObject.json_to_object json

=> #<Object:0x00000100859688 @first_name="David", @last_name="White"> 
 
obj.first_name

=> "David" 

obj.last_name

=> "White" 

obj.first_name = "Dave"

=> "Dave" 
```

And now you have a fully functioning Ruby class with data from your json file.