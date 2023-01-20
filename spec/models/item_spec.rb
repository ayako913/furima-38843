require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる時' do
      it '商品画像、商品名、説明、カテゴリー、状態、配送料の負担、発送元、日数、価格があれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない時' do
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーが１では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が１では出品できない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it '配送料の負担が１では出品できない' do
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it '発送元が１では出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '日数が１では出品できない' do
        @item.severalday_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Severalday can't be blank")
      end
      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300以下では出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it '価格が9999999以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it '価格が全角では出品できない' do
        @item.price = '１００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
