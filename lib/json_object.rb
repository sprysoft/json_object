require "json_object/version"
require "json"
require "active_support/core_ext/string"

module JSONObject
  def self.json_to_object json, class_name = "object"
    json_obj = JSON.parse(json)
    
    Object.const_set(class_name.classify, Class.new) unless class_name == "object"

    klass = class_name.classify.constantize 

    klass.instance_eval do
      attr_accessor *(json_obj.keys)
    end

    klass = klass.new

    json_obj.each do |key, value|
      klass.instance_variable_set "@#{key}".to_sym, value
    end

    return klass
  end
end
