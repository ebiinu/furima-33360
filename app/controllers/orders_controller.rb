class OrdersController < ApplicationController
  def index
    @order = UserOrder.new
  end
end
