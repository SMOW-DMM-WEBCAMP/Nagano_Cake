class Member::CartItemsController < ApplicationController

  def index
    @cart_items = current_member.cart_items.all
  end

  def create

    @cart_item = current_member.cart_items.build(params_cart_item)
    if @cart_item.save
    redirect_to member_cart_items_path(@cart_item)
    else
    render template: "member/products/show"
    end

  end

  def show
    @cart_items = CartItem.where(member_id:current_member.id)
  end




  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(params_cart_item)
    redirect_to member_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to member_cart_items_path
  end

  def all_destroy
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_to member_cart_items_path
  end


  private

  def params_cart_item
    params.require(:cart_item).permit(:product_id, :member_id, :quantity)
  end



end
