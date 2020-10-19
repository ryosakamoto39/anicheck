class Message < ApplicationRecord
  validates :room_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true
  belongs_to :user
  belongs_to :room
  has_many :notifications, dependent: :destroy
end
