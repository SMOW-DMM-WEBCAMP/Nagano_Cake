class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @members = Member.all
  end

	def show
  	@member = Member.find(params[:id])
	end

	def edit
  	@member = Member.find(params[:id])
	end

	def update
  	@member = Member.find(params[:id])
		if @member.update(member_params)
			flash[:success] = "会員情報を更新しました"
			redirect_to admins_member_path(@member)
		else
			flash[:warning] = "入力内容を確認してください"
			render "edit"
		end
	end

  def toggle
  	@member = Member.find(params[:id])

  	if @member.taikai_status?
  		  @member.taikai_status = false
  	else
  		  @member.taikai_status = true
  	end
        @member.save
        redirect_to edit_admins_member_path(@member)
  end

	private
	def member_params
	  params.require(:member).permit(:name_sei,:name_mei,:name_kana_sei,:name_kana_mei,:postal_code,:address,:tel,:email,:taikai_status)
	end

end
