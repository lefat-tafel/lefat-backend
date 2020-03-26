require 'rails_helper'

RSpec.describe ContactInformation, e: :model do
  it 'should have the correct table name' do
    expect(ContactInformation.table_name).to eq('contact_information')
  end

  subject { FactoryBot.create(:contact_information) }

  describe 'validations' do
    %i[email name].each do |field|
      it { should validate_length_of(field).is_at_most(1024) }
    end

    %i[phone fax mobile].each do |field|
      it { should validate_length_of(field).is_at_most(64) }
    end
  end
end
