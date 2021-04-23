class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    # @items = Item.all.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :city_id, :days_to_delivery_id, :delivery_charge_id,
                                 :product_state_id, :price).merge(user_id: current_user.id)
  end
end
