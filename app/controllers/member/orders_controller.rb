class Member::OrdersController < ApplicationController
  before_action :authenticate_member!

  def new
    @member = current_member
    @order = Order.new
  end

  def confirm #"確認画面へ進む"ボタンを押したときに呼ばれる
    @cart_items = current_member.cart_items
    @order = Order.new
    @order.member_id = current_member.id
    @order.purchase_price = @order.total_price(current_member)
    @order.payment_method = params[:order][:payment_method]
    @address_option = params[:order][:address_option]

    if @address_option == "0" #選択したお届け先によってカラムに代入するものを変える
      @order.postal_code = current_member.postal_code
      @order.address = current_member.address
      @order.address_name = current_member.name_sei + current_member.name_mei
    elsif @address_option == "1"
      @shipping_address = ShippingAddress.find(params[:order][:shipping_address_id])
      @order.postal_code = @shipping_address.postal_code
      @order.address = @shipping_address.address
      @order.address_name = @shipping_address.address_name
    elsif @address_option == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.address_name = params[:order][:address_name]
    end
  end

  def create #"注文を確定する"ボタンを押したときに呼ばれる
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    @order.save

    @cart_items = current_member.cart_items
    @cart_items.each do |cart_item| #orderd_productテーブルの1レコードを作成
      OrderedProduct.create!(
        product_id: cart_item.product.id,
        order_id: @order.id,
        quantity: cart_item.quantity,
        price: (cart_item.product.price * 1.1).floor,
      )
    end
    @cart_items.destroy_all

    redirect_to thanks_member_orders_path
  end

  def thanks
  end

  def index
    @orders = current_member.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:member_id, :purchase_price, :payment_method, :address_name, :address, :postal_code)
  end
end
