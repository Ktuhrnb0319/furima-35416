class PurchasesController < ApplicationController
def index
  @purchase_address = PurchaseAddress.new
  @item = Item.find(params[:item_id])
end


def create
  @item = Item.find(params[:item_id])
  @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
end

private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :city_id, :town, :street, :building, :telephone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end