# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def destroy
    reset_session
    redirect_to new_admin_session_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
