class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit]
  before_action :move_to_index2, only: [:edit]
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
    
  end

  def edit
    
  end

  def update
    
    if @item.update(item_params)
      redirect_to item_path
    else  
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :condition_id, :price, :delivery_fee_payer_id, :prefecture_id, :preparing_day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def move_to_index2
    if @item.order.present?
      redirect_to action: :index
    end  
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
