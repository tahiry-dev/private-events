class User < ApplicationRecord
    validates :name , presence: true, length: { minimum: 3}
    has_many :created_events, class_name: 'Event', foreign_key: 'creator_id', dependent: :destroy
end
