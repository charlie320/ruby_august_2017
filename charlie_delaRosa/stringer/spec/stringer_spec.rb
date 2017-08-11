require "spec_helper"

RSpec.describe Stringer do

  it "concatenates undefined number of strings with a space" do
  expect(Stringer.spacify "Oscar", "Vazquez", "Zweig", "Olasaba", "Hernandez", "Ricardo", "Mendoza").to eq("Oscar Vazquez Zweig Olasaba Hernandez Ricardo Mendoza")
  end

  context "minifies a string" do
    it "minifies a string to a particular length and adds ..." do
      expect(Stringer.minify("Hello, my name is Charlie", 9)).to eq("Hello, my ...")
    end

    it "minifies a string and if less than integer returns string" do
      expect(Stringer.minify("Hello!", 9)).to eq("Hello!")
    end
  end

  it "iterates over a string and replaces each instance a word with a replacement word" do
    expect(Stringer.replacify("I won't go", "won't", "will")).to eq("I will go")
  end

  it "iterates over a string and adds each word into an array" do
    expect(Stringer.tokenize("I am a coding ninja")).to eq(["I", "am", "a", "coding", "ninja"])
  end

  it "removes each instance of a word" do
    expect(Stringer.removify("I'm not from Texas", "not")).to eq("I'm from Texas")
  end
end # end RSpec
