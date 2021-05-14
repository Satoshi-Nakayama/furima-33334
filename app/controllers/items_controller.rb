class ItemsController < ApplicationController

  def index
  end

  def new
    unless authenticate_user!
      redirect_to new_user_session_path
    end
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
    params.require(:item).permit(:item_name, :item_info, :item_price, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :duration_id, :image, :user).merge(user_id: current_user.id)
  end

end
