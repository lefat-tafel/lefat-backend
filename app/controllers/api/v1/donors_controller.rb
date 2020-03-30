class Api::V1::DonorsController < ApplicationController
  include StreetAddressable

  def index
  end

  def show
  end

  def create
    donor = Donor.new
    donor.name = params['name']
    donor.status = params["status"]
    donor.addresses = [build_address(params["address"])]
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
