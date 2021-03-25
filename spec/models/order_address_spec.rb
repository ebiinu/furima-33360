require 'rails_helper'

describe OrderAddress do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  describe '商品購入機能' do
    context '購入できるとき' do
      it '全て正しく記入すれば登録できる' do
        expect(@order_address).to be_valid
      end
    end
    context '購入できないとき' do
      it 'postal_codeが空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'prefecture_idが空では登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it 'house_numberが空では登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "House number can't be blank"
      end
      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'postal_codeにハイフンがない場合登録できない' do
        @order_address.postal_code = '2060021'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it 'phone_numberにハイフンをつけた場合登録できない' do
        @order_address.phone_number = '090-1707-7739'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid."
      end
      it 'phone_numberが12桁以上の場合場合登録できない' do
        @order_address.phone_number = '090170777399'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid."
      end
      it 'tokenが空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
