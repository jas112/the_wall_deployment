require 'rails_helper'

RSpec.describe Message, type: :model do
  # This is our control
  context "With valid attributes" do
    it "should save" do
      message0 = Message.new(
        message: 'This is a message',
        user_id: 1,
      )
      expect(message0).to be_valid
    end
  end

  context "With invalid attributes" do
    it "should not save if message field is blank" do
      message1 = Message.new(
        message: '',
        user_id: 2,
      )
      expect(message1).to be_invalid
    end

    it "should not save if user_id field is blank" do
      message2 = Message.new(
        message: 'This is the second message',
        user_id: '',
      )
      expect(message2).to be_invalid
    end

    it "should not save if message is less than 10 characters" do
      message3 = Message.new(
        message: 'message',
        user_id: 3,
      )
      expect(message3).to be_invalid
    end
  end

end
