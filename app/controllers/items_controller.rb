class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.includes(:user).order("created_at DESC")
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
    @item = Item.find(params[:id])
  end

  def edit
    
  end

  def update
    
  end
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :condition_id, :price, :delivery_fee_payer_id, :prefecture_id, :preparing_day_id).merge(user_id: current_user.id)
  end
end
