module StreetAddressable
  extend ActiveSupport::Concern

  included do
  end

  def build_address(address_params)
    address = Address.new
    address.line_1 = address_params["line_1"]
    address.line_2 = address_params["line_2"]
    address.line_3 = address_params["line_3"]
    address.zip_code = address_params["zip_code"]
    address.town     = address_params["town"]
    address
  end


end