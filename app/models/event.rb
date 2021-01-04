class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    validates :description, presence: true, length: { minimum: 6 }
    validates :date, presence: true
    validates :title, presence: true

    has_many :attendances, foreign_key: :attended_event_id, dependent: :destroy
    has_many :attendees, through: :attendances

    scope :past, -> { where('date<?', Time.now) }
    scope :future, -> { where('date>?', Time.now) }
end
