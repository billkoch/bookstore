require 'spec_helper'

describe Author do
  
  before(:each) do
    @attributes = {
      :last_name => "Hunt",
      :first_name => "Andy"
    }
  end
  
  it "should pass validation given valid attributes and save itself" do
    author = Author.new(@attributes)
    author.valid?.should be_true
    author.save.should be_true
  end
  
  it "should require a last name" do
    @attributes[:last_name] = nil
    author = Author.new(@attributes)
    author.valid?.should be_false
    author.errors.should include([:last_name, :not_present])
  end
  
  it "should require a first name" do
    @attributes[:first_name] = nil
    author = Author.new(@attributes)
    author.valid?.should be_false
    author.errors.should include([:first_name, :not_present])
  end
end
