class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_one :contact_information, as: :contactable, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy

  accepts_nested_attributes_for :contact_information
  accepts_nested_attributes_for :address

  validates :contact_information, presence: true
  validates :address, presence: true

  after_initialize do |user|
    user.build_address
    user.build_contact_information
  end

  default_scope -> { includes(:address, :contact_information) }
end
