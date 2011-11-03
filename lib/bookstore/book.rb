class Book < Ohm::Model
  attribute :title
  attribute :published_date
  
  def validate
    assert_present :title
    assert_present :published_date
  end
end
