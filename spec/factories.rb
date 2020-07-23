FactoryBot.define do
	factory :hospital, class: Hospital do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    phone { Faker::PhoneNumber.phone_number }
    geocode_lat { rand(-90.0..90.0) }
    geocode_long { rand(-180.0..180.0) }
  end
end