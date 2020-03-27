class Address < ApplicationRecord
  validates :line_1, :zip_code, :town, presence: true
  validates :line_1, :line_2, :line_3, :town, length: { maximum: 1024 }
  validates :zip_code, length: { maximum: 256 }

  belongs_to :addressable, polymorphic: true
end
