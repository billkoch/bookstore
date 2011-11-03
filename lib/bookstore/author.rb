class Author < Ohm::Model
  attribute :last_name
  attribute :first_name
  
  def validate
    assert_present :last_name
    assert_present :first_name
  end
end
