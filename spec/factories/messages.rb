FactoryGirl.define do
  factory :message do
    message "This is a message"
    user
  end
end
