class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session

  helper_method :current_cart

  def current_item
    if session[:cart_item_id]
      @cart_item = CartItem.find(session[:cart_item_id])
    else
      @cart_item = CartItem.create
      session[:cart_item_id] = @cart_item.id
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_sei, :name_mei, :name_kana_sei, :name_kana_mei, :postal_code, :address, :tel])
  end
end
