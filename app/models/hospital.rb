class Hospital < ApplicationRecord
  validates :name,
            :address,
            :city,
            :phone,
            :geocode_lat,
            :geocode_long, presence: true
end
