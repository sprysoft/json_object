require "json_object/version"
require "json"
require "active_support/core_ext/string"

module JSONObject
  def self.json_to_object json = "", class_name = "object"
    klass = class_name == "object" ? Object.new : class_name.constantize.classify.new

    unless json == ""
      json_obj = JSON.parse(json)

      klass.class_eval do
        attr_accessor *(json_obj.keys)

        define_method :initialize do |*values|
          names.each_with_index do |name,i|
            instance_variable_set("@"+name, values[i])
          end
        end
      end

      json_obj.each do |key, value|
        klass.instance_variable_set "@#{key}".to_sym, value
      end
    end
    return klass
  end
end
