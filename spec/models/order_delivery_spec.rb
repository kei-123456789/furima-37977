require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_delivery = FactoryBot.build(:order_delivery, user_id: user.id, item_id: item.id)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@order_delivery).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @order_delivery.building = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと購入できない' do
        @order_delivery.token = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと購入できない' do
        @order_delivery.postal_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @order_delivery.postal_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idが1だと購入できない' do
        @order_delivery.prefecture_id = '1'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'municipalitiesが空だと購入できない' do
        @order_delivery.municipalities = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと購入できない' do
        @order_delivery.address = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと購入できない' do
        @order_delivery.telephone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが半角数字9桁以下だと購入できない' do
        @order_delivery.telephone_number = '123456'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが半角数字12桁以上だと購入できない' do
        @order_delivery.telephone_number = '090111111111111'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが全角数字だと購入できない' do
        @order_delivery.telephone_number = '０９０１１１１１１１１'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'userが紐付いていないと購入できない' do
        @order_delivery.user_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できない' do
        @order_delivery.item_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
