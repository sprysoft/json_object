require 'json_object'

describe JSONObject do
  context '#json_to_object' do
    it 'should return Object class when no json is passed' do
      object = JSONObject.json_to_object 
      object.class.should == Object.new.class
    end

    context ' created with following JSON "{ "name" : "David" }"' do

      before :all do
        json = '{ "name" : "David" }'
        @object = JSONObject.json_to_object json
        puts @object.inspect
      end

      it 'should return Object class that responds to name method' do
        @object.respond_to?(:name).should == true
      end

      it 'should return Object class that returns "David" on name method' do
        @object.name.should == "David"
      end
    end

  end
end