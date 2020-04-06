require 'rails_helper'

RSpec.describe Api::V1::RecipientsController, type: :controller do

  it "creates recipient" do
    post :create, params: {:recipient =>  recipient_params}, :format => :json

    response_body = JSON.parse(response.body)
    expect(response_body.keys).to eql ["status", "code"]
    expect(response_body["code"]).to eql 200
  end

  private

  def recipient_params
    recipient = build(:recipient)
    recipient.slice(:people_in_household, :status)
                 .merge!(address: recipient.address.slice(:line_1, :line_2, :line_3, :zip_code, :town))
                 .merge!(contact_information: recipient.contact_information.slice(:name, :email, :phone, :mobile, :fax))
  end

end
