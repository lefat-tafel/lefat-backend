require 'rails_helper'

RSpec.describe Api::V1::DonorsController, type: :controller do

  it "creates donor" do
    post :create, params: {name: "Jack Reacher", status: "ApplicationPending", address: {line_1: "123 Main St", zip_code: "80221", town: "Denver"}}
    response_body = JSON.parse(response.body)
    expect(response_body.keys).to eql ["status", "code"]
    expect(response_body["code"]).to eql 200
  end

end
