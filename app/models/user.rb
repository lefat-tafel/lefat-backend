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

  validates :contact_information, presence: true

  after_initialize do |user|
    if new_record? && !user.contact_information.present?
      user.build_contact_information
    end
  end

  default_scope -> { includes(:address, :contact_information) }
end
