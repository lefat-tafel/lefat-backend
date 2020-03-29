require 'rails_helper'

RSpec.describe Address, type: :model do
  subject { FactoryBot.build(:address) }

  describe 'validations' do
    it { should validate_presence_of(:line_1) }
    it { should validate_presence_of(:zip_code) }
    it { should validate_presence_of(:town) }

    %i[line_1 line_2 line_3 town].each do |field|
      it { should validate_length_of(field).is_at_most(1024) }
    end

    it { should validate_length_of(:zip_code).is_at_most(256) }
  end

  it { should belong_to(:addressable) }
end