FactoryBot.define do
  factory :recipient  do
    people_in_household { 4 }
    status { "Application Pending"}

    address
    contact_information
  end

end