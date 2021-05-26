class Review < ApplicationRecord
  belongs_to :restaurant # restaurant_id

  validates :content, presence: true
end
