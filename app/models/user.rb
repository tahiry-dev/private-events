class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id', dependent: :destroy

  has_many :attendances, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :attendances
end
