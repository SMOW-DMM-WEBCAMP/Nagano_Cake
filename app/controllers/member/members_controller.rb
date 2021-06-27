class Member::MembersController < ApplicationController

#ログインユーザーのみ
  before_action :authenticate_member!
#@memberの値のセット
  before_action :set_member

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = current_member
    if @member.update(member_params)
      flash[:success] = "更新に成功しました"
      redirect_to member_member_path(@member)
    else
      flash[:warning] = "入力内容を確認してください"
      render :edit
    end
  end

  def confirm
    @member = current_member
  end

  def withdraw
    @member = Member.find(params[:id])
    @member.update(taikai_status: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name_sei, :name_mei, :name_kana_sei, :name_kana_mei, :address, :postal_code, :tel, :email, :taikai_status)
  end

end