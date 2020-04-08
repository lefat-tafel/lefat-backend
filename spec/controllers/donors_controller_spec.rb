require 'rails_helper'

RSpec.describe Api::V1::DonorsController, type: :controller do

  it "creates donor" do
    post :create, params: {:donor =>  donor_params}, :format => :json
    response_body = JSON.parse(response.body)
    expect(response_body.keys).to eql ["status", "code"]
    expect(response_body["code"]).to eql 200
  end

  private

    def donor_params
      donor = build(:donor)
      donor.slice(:name, :status)
                   .merge!(address: donor.address.slice(:line_1, :line_2, :line_3, :zip_code, :town))
                   .merge!(contact_information: donor.contact_information.slice(:name, :email, :phone, :mobile, :fax))
    end

end
