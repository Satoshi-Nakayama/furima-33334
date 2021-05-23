class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @address = Address.new
  end

  def create
  end

end
