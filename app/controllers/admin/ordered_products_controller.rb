class Admin::OrderedProductsController < ApplicationController
  before_action :authenticate_admin!

  def update
    ordered_product = OrderedProduct.find(params[:id])
    ordered_product.update(ordered_product_params)
    order = ordered_product.order
    redirect_to admin_order_path(order)
  end


  private

  def ordered_product_params
    params.require(:ordered_product).permit(:production_status)
  end
end
