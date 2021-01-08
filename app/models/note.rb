class Note < ApplicationRecord
  belongs_to :post
  validates :name, presence: true, length: {in: 1..20}
  validates :message, presence: true, length: {in: 1..100}
end
