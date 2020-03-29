class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_one :address, as: :addressable, dependent: :destroy
  has_one :contact_information, as: :contactable, dependent: :destroy

  accepts_nested_attributes_for :address, :contact_information

  default_scope -> { includes(:address, :contact_information) }
end
