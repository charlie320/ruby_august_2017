FactoryGirl.define do
  factory :secret do
    content "This a secret."
    user # nil
  end
end
