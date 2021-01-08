class Post < ApplicationRecord
    has_many :notes, dependent: :destroy
    validates :name, :location, :lat, :lng, presence: true, length: { in: 1..20}
    validates :location, length: { in: 1..30}
end
