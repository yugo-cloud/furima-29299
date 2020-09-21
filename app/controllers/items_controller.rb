class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if@items.save
      retern redirect_to root_path
    else
      rernder "new"
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :handling_time_id, :price).merge(user_id: current_user.id)
  end


end