require 'rails_helper'
include ActionController::RespondWith

describe 'sign_up', type: :request do
  before(:each) do
    @user_attributes = FactoryBot.attributes_for(:user)
  end

  it 'with valid parameters status should be 200' do
    post '/api/v1/auth', params: @user_attributes
    expect(response.status).to eq(200)
  end

  it 'should create a user' do
    count_before = User.count
    post '/api/v1/auth', params: @user_attributes
    expect(response.status).to eq(200)
    expect(User.count).to eq(count_before + 1)
  end

  describe 'invalid requests' do
    it 'should fail when email is missing' do
      @user_attributes[:email] = ''
      post '/api/v1/auth', params: @user_attributes
      expect(response.status).to eq(422)
    end
  end

  describe 'with nested address' do
    before(:each) do
      @user_attributes[:address_attributes] = FactoryBot.attributes_for(:address)
    end

    it 'should accept a nested address' do
      post '/api/v1/auth', params: @user_attributes
      expect(response.status).to eq(200)
    end

    it 'should create a new address when submitted with nested address' do
      count_before = User.count
      post '/api/v1/auth', params: @user_attributes
      expect(User.count).to eq(count_before + 1)
    end

    it 'should respond with 400 when address is malformed' do
      @user_attributes[:address_attributes][:line_1] = ''
      post '/api/v1/auth', params: @user_attributes
      expect(response.status).to eq(422)
    end
  end
end