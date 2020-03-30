class Recipient < ApplicationRecord

  has_many :addresses, as: :addressable
  has_one :contact_information, as: :contactable

  validates :people_in_household, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1 }
  validates :contact_information, presence: true
  validates :addresses, presence: true


end