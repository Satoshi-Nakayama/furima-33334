class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_check
  before_action :sold_out_check
  
  def index
    @order_address = OrderAddress.new
    set_item
  end

  def create
    set_item
    @order_address =OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:number, :exp_month, :exp_year, :cvc, :zip_code, :prefecture, :city, :address_number, :building_name, :phone_number).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def current_user_check
    set_item
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def sold_out_check
    set_item
    if @item.order != nil
      redirect_to root_path
    end
  end
end
