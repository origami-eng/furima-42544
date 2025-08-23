class AddressesController < ApplicationController
  def create
    @address = Address.create(address_params)
  end

  private
  def address_params
    params.require(:address).permit(:zip_code, :state_id, :city, :street, :building, :phone_number).merge(purchase_id: params[:purchase_id])
  end
end
