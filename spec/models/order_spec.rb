RSpec.describe Order, type: :model do
  describe '商品購入機能' do
    before do
      @order = FactoryBot.build(:order)
    end
    context '商品購入がうまくいくとき' do
      it '建物名だけ無くても値が入っていたら購入できる' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it '郵便番号が無いとき購入できない' do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include(“Post code can’t be blank”)
      end
      it '郵便番号にはハイフンが無いと購入できない' do
        @order.post_code = ‘1234567’
        @order.valid?
        expect(@order.errors.full_messages).to include(‘Post code is invalid’)
      end
      it '郵便番号は３桁-４桁なければ購入できない' do
        @order.post_code = ‘123-45678’
        @order.valid?
        expect(@order.errors.full_messages).to include(‘Post code is invalid’)
      end
      it '都道府県は0だと購入できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include(‘Prefecture must be other than 0’)
      end
      it '市区町村が無いと購入できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include(“City can’t be blank”)
      end
      it '番地が無いと購入できない' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include(“Address can’t be blank”)
      end
      it '電話番号が無いと購入できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include(“Phone number can’t be blank”)
      end
      it '電話番号がハイフン無しの11桁以外は購入できない' do
        @order.phone_number = ‘090-234-123’
        @order.valid?
        expect(@order.errors.full_messages).to include(‘Phone number is invalid’)
      end
      it 'カードのトークン情報が無いと購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include(“Token can’t be blank”)
      end
    end
  end
end