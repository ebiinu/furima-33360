require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '出品できるとき' do
      it '全て正しく記入すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'introductionが空では出品できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Introduction can't be blank"
      end
      it 'カテゴリーを選択しない場合出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it '商品状態を選択しない場合出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition must be other than 1"
      end
      it '配送料の負担を選択しない場合出品できない' do
        @item.delivery_fee_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee payer must be other than 1"
      end
      it '発送元の地域を選択しない場合出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it '発送までの日数を選択しない場合出品できない' do
        @item.preparing_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Preparing day must be other than 1"
      end
      it '販売価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '販売価格が300円未満の場合出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input 300 ~ 99999999 numbers.'
      end
      it '販売価格が100000000円以上の場合できない' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input 300 ~ 99999999 numbers.'
      end
      it '販売価格が全角の場合登録できない' do
        @item.price = '２２２２'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input 300 ~ 99999999 numbers.'
      end
      it '販売価格が半角立ったとしても数字でない場合出品できない' do
        @item.price = 'ｻﾔｶ'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input 300 ~ 99999999 numbers.'
      end
    end
  end
end