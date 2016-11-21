class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

	def not_found
	  raise ActionController::RoutingError.new('Not Found')
	end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellido, :telefono, :fecha_nacimiento, :sexo, :pais, :terminos_legales])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombre, :apellido, :telefono, :fecha_nacimiento, :sexo, :pais, :tc_apellido, :tc_nombre, :tc_numero, :tc_pin, :tc_caducidad])
  end
end