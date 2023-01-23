class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

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
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.save
      redirect_to  :show
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :charge_id, :state_id, :prefecture_id, :severalday_id, :price).merge(user_id: current_user.id)
  end
end
