class Donor < ApplicationRecord
  has_many :addresses, as: :addressable
  has_many :contact_information, as: :contactable

  validates :name, length: { maximum: 1024 }
  

end
