class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end



 
end
  # def order_params
  #  params.require(:order).permit
  # end
