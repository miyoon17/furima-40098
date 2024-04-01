require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_form.user_id = 1
        expect(@order_form).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order_form.item_id = 1
        expect(@order_form).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @order_form.post_code = '123-4560'
        expect(@order_form).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @order_form.prefecture_id = 2
        expect(@order_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order_form.city = '仙台市'
        expect(@order_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_form.address = '泉区１２３'
        expect(@order_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_form.building_name = nil
        expect(@order_form).to be_valid
      end
      it '電話番号が10桁の場合であれば保存できる' do
        @order_form.phone_number = '1234567810'
        expect(@order_form).to be_valid
      end
      it '電話番号が11桁の場合であれば保存できる' do
        @order_form.phone_number = '12345678101'
        expect(@order_form).to be_valid
      end
      it '電話番号は半角数字であれば保存できる' do
        @order_form.phone_number = '09012345678'
        expect(@order_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @order_form.post_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_form.post_code = 1_234_567
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は9桁以下だと購入できない' do
        @order_form.phone_number = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only number.")
      end
      it '電話番号は12桁以上だと購入できない' do
        @order_form.phone_number = '123456789123'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only number.")
      end
      it '電話番号は半角数字以外が含まれていると購入できない' do
        @order_form.phone_number = "1234567890a"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only number.")
      end
      it 'トークンが空だと保存できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end