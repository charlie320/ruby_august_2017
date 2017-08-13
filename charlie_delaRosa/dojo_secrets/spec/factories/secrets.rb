FactoryGirl.define do
  factory :secret do
    content "This is a secret from the factory."
    user # nil
  end
end
