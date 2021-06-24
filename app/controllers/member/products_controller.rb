class Member::ProductsController < ApplicationController

  def top
    @products = Product.all.limit(4).order('created_at DESC')
  end

  def about
  end

  def index
    @products = Product.where(sale_status: true).page(params[:page]).per(8).order('created_at DESC')
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end
  
  
  
  def products_params
    params.require(:product).permit(:genre, :name, :introduction, :price, :image, :sales_status)
  end
end