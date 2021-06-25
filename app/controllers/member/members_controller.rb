class Member::MembersController < ApplicationController

  def out
    member = current_member
    member.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end


end
