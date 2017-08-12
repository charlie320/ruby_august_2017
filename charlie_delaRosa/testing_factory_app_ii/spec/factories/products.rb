FactoryGirl.define do
  factory :product do
    name "MyString"
    user # nil removed to auto create new instance each call
  end
end
