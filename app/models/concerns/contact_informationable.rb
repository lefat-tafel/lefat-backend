module ContactInformationable
  extend ActiveSupport::Concern

  included do
  end

  def build_contact_information(params)
    contact_information = ContactInformation.new
    contact_information.name   = params["name"]
    contact_information.phone  = params["phone"]
    contact_information.fax    = params["fax"]
    contact_information.mobile = params["mobile"]
    contact_information.email  = params["email"]
    contact_information
  end
end