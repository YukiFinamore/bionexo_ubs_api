class Hospital < ApplicationRecord
  require 'csv'
  acts_as_mappable default_units:   :kms,
                   lat_column_name: :geocode_lat,
                   lng_column_name: :geocode_long

  validates :geocode_lat,
            :geocode_long, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Hospital.create! build_hospital(row)
    end
  end

  def self.build_hospital(ubs)
    {
      name: ubs["no_fantasia"],
      address: build_address(ubs),
      city: "#{ubs["uf"]} - #{ubs["cidade"]}",
      phone: ubs["nu_telefone"],
      geocode_lat: ubs["lat"],
      geocode_long: ubs["long"]
    }
  end

  def self.build_address(address)
    "#{address["no_logradouro"]}, #{address["nu_endereco"]} - #{address["no_bairro"]}"
  end
end
