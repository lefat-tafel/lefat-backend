class Recipient < ApplicationRecord

  has_one :address
  has_one :contact_information


end