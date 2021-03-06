class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_cart

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :birthday, :address, :profile_photo, :description ) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :first_name, :last_name, :email, :password, :current_password, :birthday, :address, :profile_photo, :description ) }
  end

  private

  def current_cart
    if session[:cart_id].nil?
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end

    if session[:cart_id]
      cart = Cart.find(session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end

  end

end
