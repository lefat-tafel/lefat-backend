class Api::V1::DonorsController < ApplicationController
  include StreetAddressable
  include ContactInformationable

  def index
  end

  def show
  end

  def create
    donor = Donor.new
    donor.name = params['name']
    donor.status = params["status"]
    donor.addresses = [build_address(params["address"])]
    donor.contact_information = build_contact_information(params["contact_information"])
    if donor.save!
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

end
