require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  describe 'validations' do
    it { should have_one(:address).dependent(:destroy) }
    it { should have_one(:contact_information).dependent(:destroy) }
    it { should accept_nested_attributes_for(:address) }
    it { should accept_nested_attributes_for(:contact_information) }
    it { should validate_presence_of(:contact_information) }
  end
end
