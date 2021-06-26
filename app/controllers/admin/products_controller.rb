class Admin::ProductsController < ApplicationController

  def index
    @genre = Genre.select(:genre_name)
    @product = Product.page(params[:page]).per(5)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "新規商品を追加しました。"
      redirect_to admin_product_path(@product)
    else
      flash.now[:danger] = "商品情報を正しく入力してください。"
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "商品の編集が完了しました。"
      redirect_to admin_product_path(@product)
    else
      flash.now[:danger] = "商品情報を正しく入力してください。"
      render :edit
    end
  end


  private
    def product_params
     params.require(:product).permit(:product_image, :product_name, :description, :genre_id, :price, :sale_status)
    end


end
