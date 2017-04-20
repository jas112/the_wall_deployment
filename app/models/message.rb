class Message < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :message, :user_id, presence: true
  validates :message, length: {minimum: 10}
end
