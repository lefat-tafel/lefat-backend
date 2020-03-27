FactoryBot.define do
  factory :user_without_associations, class: 'User' do
    name { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }

    factory :user do
      association :address, strategy: :build
      association :contact_information, strategy: :build
    end

    factory :user_without_address, class: 'User' do
      contact_information factory: :contact_information_without_contactable
    end

    factory :user_without_contact_information, class: 'User' do
      address factory: :address_without_addressable
    end
  end
end