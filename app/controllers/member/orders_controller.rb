class Member::OrdersController < ApplicationController
  def new
    @member = Member.find(params[:member_id])
    @order = Order.new
    @regisrated_address = Order.pluck(:postal_code, :address, :address_name)
  end

  def confirm
    @member = Member.find(params[:member_id])
  end

  def create
  end

  def thanks
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:shipping, :purchase_price, :payment_method, :address_name, :address, :postal_code, :order_status)
  end
end
