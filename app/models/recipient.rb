class Recipient < ApplicationRecord

  has_many :addresses, as: :addressable
  has_many :contact_information, as: :contactable

  validates :people_in_household, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1 }


end