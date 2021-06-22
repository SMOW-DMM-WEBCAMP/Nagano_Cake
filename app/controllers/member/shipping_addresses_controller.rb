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
    shipping_address.member_id = current_member.id  #after delete
    shipping_address.save
    redirect_to member_shipping_addresses_path
  end

  def update
    address = ShippingAddress.find(params[:id])
    address.update(params_shipping_address)

    redirect_to member_shipping_addresses_path
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
