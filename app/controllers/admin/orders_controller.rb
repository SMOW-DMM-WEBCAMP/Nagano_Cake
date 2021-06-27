class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    ordered_product = OrderedProduct.where(order_id: order)
    if order.update(order_params)
      if order.order_status.include?("入金確認")
         ordered_product.update( production_status: 1)
      end
      flash[:success] = "制作ステータスを変更しました。"
      redirect_to admin_order_path(order)
    else
      flash.now[:danger] = "制作ステータスの変更に失敗しました。"
      render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
