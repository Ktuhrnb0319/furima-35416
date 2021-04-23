class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :update, :show]

  def index
    @items = Item.all.order(created_at: :desc).includes(:user)
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

  def show
  end

  def edit
    redirect_to action: :index unless @item.user_id == current_user.id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
    redirect_to action: :index unless @item.user_id == current_user.id
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :city_id, :days_to_delivery_id, :delivery_charge_id,
                                 :product_state_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
