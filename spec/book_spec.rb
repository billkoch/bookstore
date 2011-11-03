require 'spec_helper'

describe Book do
  
  before(:each) do
    @attributes = {
      :title => "Pragmatic Thinking and Learning",
      :published_date => "2008/11/04"
    }
  end
  
  it "should pass validation given valid attributes" do
    Book.new(@attributes).valid?.should be_true
  end
  
  it "should require a title" do
    @attributes[:title] = nil
    book = Book.new(@attributes)
    book.valid?.should be_false
    book.errors.include?([:title, :not_present])
  end
  
  it "should require a published date" do
    @attributes[:published_date] = nil
    book = Book.new(@attributes)
    book.valid?.should be_false
    book.errors.include?([:published_date, :not_present])
  end
end
