require 'rails_helper'

RSpec.describe Message, type: :model do
  # Message
  # Message field: must be required, must be longer than 10 characters
  #
  context "With valid attributes" do
    it "should save" do
    #   message = Message.new(
    #     content: "This is a message!",
    #     user_id: 1
    #   )
    #   expect(message).to be_valid

      expect(build(:message)).to be_valid
    end
  end
  # User Reference field: must be required
  #
  context "With invalid attributes" do
    it "should not save if user_id field is blank" do
      # message = Message.new(
      #   content: "This is a message!",
      #   user_id: nil
      # )
      # expect(message).to be_invalid
      expect(build(:message, user: nil)).to be_invalid
    end
  end

end
