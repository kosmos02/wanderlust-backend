class Post < ApplicationRecord
    has_many :notes, dependent: :destroy
    validates :name, :date, :lat, :lng, presence: true, length: { in: 1..20}
    validates :location, presence: true, length: { in: 1..50}
end
