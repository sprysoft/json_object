# JSONObject

* http://github.com/sprysoft/json_object

## Description

JSONObject is a simple Ruby library for converting JSON objects into Ruby classes. 

It:

1. Simplifies parsing JSON objects into classes

2. Creates a series of setters, getters with instance variables for your new classes

## Introduction

### Installation

Installation could be simpler:

    gem 'json_object', '~> 0.0.2'

or

    gem install json_object


### Examples

Once you have the gem installed crack open an IRB session:

```ruby
require 'json_object'

json = '{ "first_name" : "David", "last_name" : "White" }'

obj = JSONObject.new json

=> #<Object:0x00000100859688 @first_name="David", @last_name="White"> 
 
obj.first_name

=> "David" 

obj.last_name

=> "White" 

obj.first_name = "Dave"

=> "Dave"

```

You can also create new classes completely dynamically without ever writing a class in Ruby:


```ruby
require 'json_object'

json = '{ "first_name" : "David", "last_name" : "White" }'

person = JSONObject.new json, "person"

=> #<Person:0x00000100859688 @first_name="David", @last_name="White"> 
 
person.first_name

=> "David"

person.last_name

=> "White"

person.first_name = "Dave"

=> "Dave"

person = Person.new

=> #<Person:0x00000100859688 @first_name="", @last_name=""> 

person.first_name = "Jeremy"

=> "Jeremy"

person.last_name = "White"

=> "White"

```


And now you have a fully functioning Ruby class with data from your json file.