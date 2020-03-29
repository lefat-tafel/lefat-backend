FactoryBot.define do
  factory :contact_information_without_contactable, class: 'ContactInformation' do
    name { Faker::Name.name_with_middle }
    phone { Faker::PhoneNumber.phone_number }
    fax { Faker::PhoneNumber.phone_number_with_country_code }
    mobile { Faker::PhoneNumber.cell_phone_with_country_code }
    email { Faker::Internet.email }

    factory :contact_information do
      contactable factory: :user
    end
  end
end
