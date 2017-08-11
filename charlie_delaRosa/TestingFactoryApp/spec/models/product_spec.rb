require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # expect(build(:product, user: build(:user))).to be_valid

  it "should be a valid product" do
    expect(build(:product)).to be_valid # build(:product) simplified
  end
end
