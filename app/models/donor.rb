class Donor < ApplicationRecord
  has_one :address, as: :addressable
  has_one :contact_information, as: :contactable

  validates :contact_information, presence: true
  validates :name, length: { maximum: 1024 }
  validates :address, presence: true
end
