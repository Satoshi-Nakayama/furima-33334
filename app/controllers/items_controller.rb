class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :current_user_check, only: [:edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
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
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_price, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :duration_id, :image, :user).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def current_user_check
    if current_user != @item.user
      redirect_to root_path
    end
  end





end
