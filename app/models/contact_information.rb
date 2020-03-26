class ContactInformation < ApplicationRecord
  self.table_name = 'contact_information'

  validates :name, :email, length: { maximum: 1024 }
  validates :phone, :fax, :mobile, length: { maximum: 64 }
end
