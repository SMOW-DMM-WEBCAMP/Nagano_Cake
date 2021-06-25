class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def current_item
    CartItem.find(session[:cart_item_id])
  rescue ActiveRecord::RecordNotFound
    cart_item = CartItem.create
    session[:cart_item_id] = cart_item.id
    cart_item
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_sei, :name_mei, :name_kana_sei, :name_kana_mei, :postal_code, :address, :tel])
  end
end
