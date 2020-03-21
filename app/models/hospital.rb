class Hospital < ApplicationRecord
  require 'csv'
  
  validates :name,
            :address,
            :city,
            :phone,
            :geocode_lat,
            :geocode_long, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Hospital.create! row.to_hash
    end
  end
end
