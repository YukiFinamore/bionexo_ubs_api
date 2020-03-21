class HospitalSerializer < ActiveModel::Serializer
  attributes :id,
             :name, 
             :address,
             :city,
             :phone,
             :geocode

  def geocode
    {
      lat:  object.geocode_lat,
      long: object.geocode_long
    }
  end
end
