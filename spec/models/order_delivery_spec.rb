require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_delivery = FactoryBot.build(:order_delivery, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_delivery).to be_valid
      end
      it 'buildingnameは空でも保存できること' do
        @order_delivery.buildingname = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank") 
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_delivery.postcode = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postcode is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_delivery.prefecture_id = '1'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityaddressが空だと保存できないこと' do
        @order_delivery.cityaddress = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Cityaddress can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_delivery.address = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it 'telphoneが空だと保存できないこと' do
        @order_delivery.telphone = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Telphone can't be blank")
      end
      it 'telphoneに数字以外が入っていると保存できないこと' do
        @order_delivery.telphone = '-'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Telphone is invalid. Input only number")
      end
      it 'telphoneが9桁以下だと保存できないこと' do
        @order_delivery.telphone = '0123456'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Telphone is too short")
      end
      it 'telphoneが12桁以上だと保存できない' do
        @order_delivery.telphone = '0123456789876'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Telphone is too short")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_delivery.user_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_delivery.item_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
