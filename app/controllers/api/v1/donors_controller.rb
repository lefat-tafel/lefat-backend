class Api::V1::DonorsController < ApplicationController
  include StreetAddressable
  include ContactInformationable

  def index
  end

  def show
  end

  def create
    donor = Donor.new
    donor.name = donor_params['name']
    donor.status = donor_params[:status]
    donor.address = build_address(donor_params[:address])
    donor.contact_information = build_contact_information(donor_params[:contact_information])
    if donor.save
      render json: {status: 'ok', code: 200}
    else
      render json: {status: 'not_acceptable', error: "Invalid donor params", code: 406}
    end
  end

  def update
  end

  def destroy
  end

  private

    def donor_params
      params.require(:donor).permit(:name, :status, address: [:line_1, :line_2, :line_3, :zip_code, :town],
                                        contact_information: [:name, :phone, :mobile, :fax, :email] )
    end

end
