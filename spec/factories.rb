FactoryBot.define do
	factory :ubs, class: Hospital do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    city { Faler::Address.city }
    phone { Faker::PhoneNumber.phone_number }
    geocode_lat { Faker::Number.decimal(l_digits: 2, r_digits: 7) #=> 181.843 }
    geocode_long { Faker::Number.decimal(l_digits: 2, r_digits: 7) #=> 181.843 }
  end
end