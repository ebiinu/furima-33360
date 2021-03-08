class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
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
    params.require(:item).permit(:image, :name, :introduction, :category_id, :condition_id, :price, :delivery_fee_payer_id, :prefecture_id, :preparing_day_id).merge(user_id: current_user.id)
  end
end
