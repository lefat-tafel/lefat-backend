FactoryBot.define do
  factory :user, class: 'User' do
    name { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }

    factory :user_with_address_and_contact_information, class: 'User' do
      association :address, :address_without_adressable
      association :contact_information, :contact_information_without_contactable
    end

    factory :user_with_address, class: 'User' do
      association :address, :address_without_addressable
    end

    factory :user_with_contact_information, class: 'User' do
      association :contact_information, :contact_information_without_contactable
    end
  end
end