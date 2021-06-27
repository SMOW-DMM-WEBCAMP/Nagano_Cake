class Admin::OrderedProductsController < ApplicationController
  before_action :authenticate_admin!

  def update
    ordered_product = OrderedProduct.find(params[:id])
    flash[:success] = "制作ステータスを変更しました。"
    ordered_product.update(ordered_product_params)
    order = ordered_product.order
    if params[:ordered_product][:production_status] == "製作中"
      order.update(order_status: 2)
    end
    if order.ordered_products.all?{ |ordered_product| ordered_product.production_status == "製作完了"}
      order.update(order_status: 3)
    end
    redirect_to admin_order_path(order)
  end


  private

  def ordered_product_params
    params.require(:ordered_product).permit(:production_status)
  end
end
