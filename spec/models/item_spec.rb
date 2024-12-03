require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'すべての情報が正しく入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '画像が添付されていないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品名が40文字以上では登録できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include 'Name is too long (maximum is 40 characters)'
      end
      it '商品の説明が空では登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item info can't be blank"
      end
      it '商品の説明が1000文字以上では登録できない' do
        @item.item_info = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Item info is too long (maximum is 1000 characters)')
      end
      it 'カテゴリーが選択されていないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態が空では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it '配送料の負担が空では登録できない' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping can't be blank"
      end
      it '発送元の地域が空では登録できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Region can't be blank"
      end
      it '発送までの日数が空では登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end
      it '販売価格が空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '販売価格は半角数字でないと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it '販売価格が300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it '販売価格が9999999より大きい場合は登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it 'userと紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
