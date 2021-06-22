class Member::OrdersController < ApplicationController
  def new
    @member = current_member
    @order = Order.new
  end

  def confirm
   
  end

  def create
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    
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
