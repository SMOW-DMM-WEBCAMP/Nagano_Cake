class Member::ShippingAddressesController < ApplicationController

  def index
    @address = ShippingAddress.new
    @addresses = ShippingAddress.all
  end

  def edit
    @address = ShippingAddress.find(params[:id])
  end


  def create
    shipping_address = ShippingAddress.new(params_shipping_address)
    shipping_address.member_id = current_member.id
    if shipping_address.save
      flash[:success] = "新規配送先を追加しました。"
      redirect_to (member_shipping_addresses_path) and return
    else
      flash[:danger] = "配送先を正しく入力してください。"
      redirect_to (member_shipping_addresses_path) and return
    end
  end

  def update
    address = ShippingAddress.find(params[:id])
    if address.update(params_shipping_address)
      flash[:success] = "配送先の編集が完了しました。"
      redirect_to member_shipping_addresses_path
    else
      flash.now[:danger] = "配送先を正しく入力してください。"
      render :edit
    end
  end

  def destroy
    @address = ShippingAddress.find(params[:id])
    @address.destroy
    redirect_to member_shipping_addresses_path
  end


private
 def params_shipping_address
   params.require(:shipping_address).permit(:postal_code, :address, :address_name)

 end
end
