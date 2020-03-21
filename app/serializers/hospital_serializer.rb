class HospitalSerializer < ActiveModel::Serializer
  attributes :id,
             :name, 
             :address,
             :city,
             :phone,
             :geocode_lat,
             :geocode_long
end
