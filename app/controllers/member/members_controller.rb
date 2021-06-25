class Member::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
    if @member == current_user
      render "edit"
    else
      redirect_to member_path(current_user)
    end
  end

  def out
    member = current_member
    member.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

end
