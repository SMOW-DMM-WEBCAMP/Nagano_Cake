class Members::SessionsController < Devise::SessionsController

  before_action :reject_member, only: [:create]

  protected

  def after_sign_in_path_for(resource)
    admin_products_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

  def reject_member
    @member = Member.find_by(email: params[:member][:email].downcase)
    if @member
      if (@member.valid_password?(params[:member][:password]) && (@member.active_for_authentication? == false))
        flash[:alert] = "このアカウントは退会済みです。"
        redirect_to new_member_session_path
      end
    else
      flash[:alert] = "必須項目を入力してください"
    end
  end
end