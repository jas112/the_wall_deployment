require 'rails_helper'
RSpec.describe User do
  # This is our control
  context "With valid attributes" do
    it "should save" do
      user0 = User.new(
        first_name: 'shane',
        last_name: 'chang',
        email: 'schang@codingdojo.com'
      )
      expect(user0).to be_valid
    end
  end

  context "With invalid attributes" do
    it "should not save if first_name field is blank" do
      user1 = User.new(
            first_name: '',
            last_name: 'chang',
            email: 'schang@codingdojo.com'
        )
      expect(user1).to be_invalid
    end

    it "should not save if last_name field is blank" do
      user2 = User.new(
            first_name: 'shane',
            last_name: '',
            email: 'schang@codingdojo.com'
        )
      expect(user2).to be_invalid
    end

    it "should not save if email already exists" do
      user3 = User.create(
        first_name: 'shane',
        last_name: 'chang',
        email: 'schang@codingdojo.com'
      )
      user4 = User.new(
            first_name: 'shane',
            last_name: 'chang',
            email: 'schang@codingdojo.com'
        )
      expect(user4).to be_invalid
    end

    it "should not save if invalid email format" do
      user5 = User.new(
            first_name: 'shane',
            last_name: 'chang',
            email: 'schangcodingdojo.com'
        )
      expect(user5).to be_invalid
    end
  end
end
