require 'rails_helper'

RSpec.describe Api::V1::RecipientsController, type: :controller do

  it "creates recipient" do
    post :create, params: {people_in_household: 2, status: "ApplicationPending",
                           address: {line_1: "123 Main St", zip_code: "80221", town: "Denver"},
                           contact_information: {name: "John Bolt", email: "john@gmail.com", phone: "303.222.3334",
                                                 mobile: "303.333.4444", fax: "800.552.2251"}}

    response_body = JSON.parse(response.body)
    expect(response_body.keys).to eql ["status", "code"]
    expect(response_body["code"]).to eql 200
  end

end
