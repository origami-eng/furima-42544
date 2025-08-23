require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入情報の保存' do
    context '購入情報を保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end

      it 'buildingが空でも保存できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '購入情報を保存できない場合' do
      it 'tokenが空では保存できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'zip_codeが空では保存できない' do
        @purchase_address.zip_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zip code can't be blank")
      end

      it 'zip_codeにハイフンが含まれていないと保存できない' do
        @purchase_address.zip_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end

      it 'state_idが0では保存できない' do
        @purchase_address.state_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("State must be other than 0")
      end

      it 'cityが空では保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'streetが空では保存できない' do
        @purchase_address.street = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberにハイフンが含まれていると保存できない' do
        @purchase_address.phone_number = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input only 10 or 11 digit numbers")
      end

      it 'phone_numberが9桁以下では保存できない' do
        @purchase_address.phone_number = '090123456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input only 10 or 11 digit numbers")
      end

      it 'phone_numberが12桁以上では保存できない' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input only 10 or 11 digit numbers")
      end

      it 'phone_numberに英字が含まれていると保存できない' do
        @purchase_address.phone_number = '090abcd5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input only 10 or 11 digit numbers")
      end

      it 'user_idが空では保存できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では保存できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
