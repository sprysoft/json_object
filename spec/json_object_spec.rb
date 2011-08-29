require 'json_object'

describe JSONObject do
  context '#json_to_object' do
    
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

      it "should allow me to create a new class that responds to first_name" do
        person = Person.new
        person.respond_to?(:first_name).should == true
      end

      it "should allow me to create a new class that responds to last_name" do
        person = Person.new
        person.respond_to?(:last_name).should == true
      end
    end
  end
end