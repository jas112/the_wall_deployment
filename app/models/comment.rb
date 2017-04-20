class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :message
  validates :comment, :user_id, :message_id, presence: true
  validates :comment, length: {minimum: 10}
end
