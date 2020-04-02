class Api::V1::RecipientsController < ApplicationController
  include StreetAddressable
  include ContactInformationable

  def index
  end

  def show
  end

  def create
    recipient = Recipient.new
    recipient.people_in_household = params["people_in_household"]
    recipient.status = params["status"]
    recipient.address = build_address(params["address"])
    recipient.contact_information = build_contact_information(params["contact_information"])
    if recipient.save!
      render json: {status: 'ok', code: 200}
    else
      render json: {status: 'not_acceptable', error: "Invalid recipient params", code: 406}
    end
  end

  def update
  end

  def destroy
  end

end

