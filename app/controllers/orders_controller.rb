class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :move_to_index]
  before_action :move_to_index
  def index
    @order_address = OrderAddress.new
  end
  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  # 全てのストロングパラメーターを1つに統合
 def order_params
  params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
 end

 def move_to_index
  if @item.user_id == current_user.id || @item.order.present?
    redirect_to root_path
  end  
 end
 
 def set_item
  @item = Item.find(params[:item_id])
 end

 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,  
    card: order_params[:token],  
    currency: 'jpy'               
  )
 end

end
