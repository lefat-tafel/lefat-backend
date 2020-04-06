class Api::V1::RecipientsController < ApplicationController
  include StreetAddressable
  include ContactInformationable

  def index
  end

  def show
  end

  def create
    recipient = Recipient.new
    recipient.people_in_household = recipient_params[:people_in_household]
    recipient.status = recipient_params[:status]
    recipient.address = build_address(recipient_params[:address])
    recipient.contact_information = build_contact_information(recipient_params[:contact_information])
    if recipient.save
      render json: {status: 'ok', code: 200}
    else
      render json: {status: 'not_acceptable', error: "Invalid recipient params", code: 406}
    end
  end

  def update
  end

  def destroy
  end

  private

  def recipient_params
    params.require(:recipient).permit(:people_in_household, :status, address: [:line_1, :line_2, :line_3, :zip_code, :town],
                                      contact_information: [:name, :phone, :mobile, :fax, :email] )
  end

end

