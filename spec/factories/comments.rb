FactoryGirl.define do
  factory :comment do
    comment "This is a comment"
    user
    message
  end
end
