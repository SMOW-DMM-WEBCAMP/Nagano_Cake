class Admin::ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product)
  end

  private
    def product_params
      params.require(:product).permit(:product_image, :product_name, :description, :genre_id, :price, :sale_status)
    end
end
