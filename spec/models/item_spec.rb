require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品ができる時' do
      it 'titleとdescriptionとcategory_idとproduct_state_idとdelivery_charge_idとcity_idとdays_to_delivery_idとpriceとimageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない時' do
      it 'titleが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end

      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'category_idが選ばれていないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category Select'
      end

      it 'product_state_idが選ばれていないと出品できない' do
        @item.product_state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Product state Select'
      end

      it 'delivery_charge_idが選ばれていないと出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery charge Select'
      end

      it 'city_idが選ばれていないと出品できない' do
        @item.city_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'City Select'
      end

      it 'days_to_delivery_idが選ばれていないと出品できない' do
        @item.days_to_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Days to delivery Select'
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceは半角数字でなければ登録できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end

      it 'priceは半角英数字混合では登録できない' do
        @item.price = '300a'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end

      it 'priceは半角英字のみでは登録できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end

      it 'priceは300以上でなければ登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end

      it 'priceは9999999以内でなければ登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end

      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
    end
  end
end
