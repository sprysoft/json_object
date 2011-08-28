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
      end

      it 'should return Object class that responds to name method' do
        @object.respond_to?(:name).should == true
      end

      it 'should return Object class that returns "David" on name method' do
        @object.name.should == "David"
      end

      it 'should allow the name to be changed' do
        @object.name = "Dave"
        @object.name.should == "Dave"
      end
    end

    context ' created with following JSON "{ "first_name" : "David", "last_name" : "White" }"' do
      before :all do
        json = '{ "first_name" : "David", "last_name" : "White" }'
        @person = JSONObject.json_to_object json, "person"
      end
      
      it "should allow me to change the name of the class" do
        @person.class.should == Person
      end

      it "should allow me to create new classes with that class" do
        person = Person.new        
        person.class.should == Person
      end
    end

  end
end