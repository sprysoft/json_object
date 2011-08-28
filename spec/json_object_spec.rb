require 'json_object'

describe JSONObject do
  context '#json_to_object' do
    it 'should return Object class when no json is passed' do
      object = JSONObject.json_to_object 
      object.class.should == Object.new.class
    end
  end
end