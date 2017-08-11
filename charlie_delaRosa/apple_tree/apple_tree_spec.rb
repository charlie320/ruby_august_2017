require_relative 'apple_tree'
RSpec.describe AppleTree do
  before(:each) do
    @apple_tree = AppleTree.new
  end

# • Apple Tree should have an age attribute with getter and setter methods.
  it "has a getter and setter for age attribute" do
    @apple_tree.age = 5
    expect(@apple_tree.age).to eq(5)
  end
# • Apple Tree should have a height attribute with only a getter method. You should raise a NoMethodError if anyone tries to set the height attribute directly.
  it "has a height getter method and should not be able to be set by the instance variable" do
    expect(@apple_tree.height).to eq(10)
    expect { @apple_tree.height = 5 }.to raise_error(NoMethodError)
  end
# • Apple Tree should have an apple count attribute with only a getter method. You should raise a NoMethodError if anyone tries to set the apple count attribute directly.
  it "has an apple_count attribute with only getter method" do
    expect(@apple_tree.apple_count).to eq(0)
    expect { @apple_tree.height = 5 }.to raise_error(NoMethodError)
  end

  context "should have a method year_gone_by" do

    before(:each) do
      @apple_tree.year_gone_by
    end

    it "should add 1 year to age" do
      expect(@apple_tree.age).to eq(1)
    end

    it "should increase height by 10%" do
      expect(@apple_tree.height).to eq(11)
    end

    it "should raise the apple count by 2" do
      expect(@apple_tree.apple_count).to eq(0)
    end

    context "increases apple_count by 2 in a certain range" do
    # • Apple Tree should not grow apples for the first three years of its life
      it "should not grow apples if age less than 3" do
        2.times { @apple_tree.year_gone_by }
        expect(@apple_tree.apple_count).to eq(0)
      end
      it "should grow apples if age is more than 3" do
        4.times { @apple_tree.year_gone_by }
        expect(@apple_tree.apple_count).to eq(4)
      end
    # • Apple Tree should have a method called pick_apples that takes all of the apples off the tree
      it "should not have any apples after calling pick_apples" do
        @apple_tree.pick_apples
        expect(@apple_tree.apple_count).to eq(0)
      end
      # • Apple Tree should not grow apples if it's older than ten.
      it "should not increase apple count if older than 10 years" do
        @apple_tree.age = 11
        @apple_tree.year_gone_by
        expect(@apple_tree.apple_count).to eq(0)
      end
    end#end context
  end#end context
end#end class
