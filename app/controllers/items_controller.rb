class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :select_item, only: [:show, :edit]

  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if@item.save
      redirect_to root_path
    else
      render "new"
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
    if @item.user_id == current_user.id
      return redirect_to item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :handling_time_id, :price).merge(user_id: current_user.id)
  end
end

#   def select_item
#     @item = Item.find(params[:id])
#   end
# before_actionも検討しましたが変更があった時記述しやすいよう今回は見送り
# 後学のためにコードだけ残しておきます