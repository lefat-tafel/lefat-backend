require 'rails_helper'
include ActionController::RespondWith

describe 'Whether sign_up is working correctly', type: :request do
  before(:each) do
    @user_attributes = FactoryBot.attributes_for(:user)
    @user_attributes[:address_attributes] = FactoryBot.attributes_for(:address)
    @user_attributes[:contact_information_attributes] = FactoryBot.attributes_for(:contact_information)
  end

  it 'should sign up a user with its address and contact info' do
    post '/api/v1/auth', params: @user_attributes
    expect(response.status).to eq(200)
  end
end