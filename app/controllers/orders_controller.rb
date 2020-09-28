class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

private

def order_params
  params.permit(:post_code, :prefecture, :city, :address, :building_name, :phone_number, :item_id, :token).merge(user_id: current_user.id)
end

def pay_item
  Payjp.api_key = "sk_test_3fd3860cd556879b1fe62d99"  # PAY.JPテスト秘密鍵
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency:'jpy'                 # 通貨の種類(日本円)
  )
end

 
end
  # def order_params
  #  params.require(:order).permit
  # end
