class Admin::MembersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @members = Member.all.page(params[:page]).per(10)
  end

	def show
  	@member = Member.find(params[:id])
	end

	def edit
  	@member = Member.find(params[:id])
	end

	def update
  	@member = Member.find(params[:id])
		if @member.update(customer_params)
		   flash[:success] = "会員情報を変更しました"
		   redirect_to admin_member_path
		else
			render "edit"
		end
	end

	private
	def member_params
	  params.require(:member).permit(:name_sei,:name_mei,:name_kana_sei,:name_kana_mei,:postal_code,:address,:tel,:email,:taikai_status)
	end

end
