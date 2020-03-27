FactoryBot.define do
  factory :address_without_addressable, class: 'Address' do
    line_1 { Faker::Address.street_address }
    line_2 { Faker::Address.secondary_address }
    line_3 { Faker::Address.community }
    zip_code { Faker::Address.zip_code }
    town { Faker::Address.city }

    factory :address do
      addressable factory: :user_without_address
    end
  end
end
