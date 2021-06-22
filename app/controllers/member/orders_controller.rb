class Member::OrdersController < ApplicationController
  def new
    @member = current_member
    @order = Order.new
    @shipping_addresses = ShippingAddress.find(params[:member_id])
  end

  def confirm

  end

  def create
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    @order.purchase_price = @order.cal_price(current_member)
    @order.save
    redirect_to thanks_member_orders_path
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
