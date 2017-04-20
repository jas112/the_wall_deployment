require 'rails_helper'

RSpec.describe Comment, type: :model do
  # This is our control
  context "With valid attributes" do
    it "should save" do
      comment0 = Comment.new(
        comment: 'This is a message',
        user_id: 1,
        message_id: 1,
      )
      expect(comment0).to be_valid
    end

    # it "should save" do
    # expect(build(:comment)).to be_valid
    # end

  end

  context "With invalid attributes" do
    it "should not save if comment field is blank" do
      comment1 = Comment.new(
        comment: '',
        user_id: 1,
        message_id: 1,
      )
      expect(comment1).to be_invalid
    end

    it "should not save if user_id field is blank" do
      comment2 = Comment.new(
        comment: 'This is the second message',
        user_id: '',
        message_id: 2,
      )
      expect(comment2).to be_invalid
    end

    it "should not save if message_id field is blank" do
      comment3 = Comment.new(
        comment: 'This is the second message',
        user_id: 3,
        message_id: '',
      )
      expect(comment3).to be_invalid
    end

    it "should not save if comment is less than 10 characters" do
      comment4 = Comment.new(
        comment: 'comment',
        user_id: 4,
        message_id: 4,
      )
      expect(comment4).to be_invalid
    end
  end

end
