class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
        :name, :email,
        address_attributes: %i[line_1 line_2 line_3 zip_code town],
        contact_information_attributes: %i[name email phone fax mobile]
    ])
  end
end
