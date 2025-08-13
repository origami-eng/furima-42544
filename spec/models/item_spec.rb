require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '出品できない場合' do
    it '商品画像が空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空では出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品説明が空では出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーが---（id:1）では出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it '商品の状態が---（id:1）では出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it '配送料の負担が---（id:1）では出品できない' do
      @item.shipping_fee_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee charge must be other than 1")
    end

    it '発送元の地域が---（id:1）では出品できない' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("State must be other than 1")
    end

    it '発送までの日数が---（id:1）では出品できない' do
      @item.shipping_time_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping time must be other than 1")
    end

    it '価格が空では出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が¥300未満では出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it '価格が¥10,000,000以上では出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it '価格が半角数値以外では出品できない（例: 全角数字）' do
      @item.price = '３０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'userが紐づいていないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User can't be blank")
    end
  end

  context '出品できる場合' do
    it 'すべての項目が正しく入力されていれば出品できる' do
      expect(@item).to be_valid
    end
  end
end
