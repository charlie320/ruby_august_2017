FactoryGirl.define do
  factory :message do
    content "This is a test message!"
    user # nil
  end
end
