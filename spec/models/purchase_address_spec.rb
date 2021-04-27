require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe ' 購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.5
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.postal_code = '1111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'cityを選択していないと保存できないこと' do
        @purchase_address.city_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('City Select')
      end
      it 'townが空だと保存できないこと' do
        @purchase_address.town = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Town can't be blank")
      end
      it 'streetが空だと保存できないこと' do
        @purchase_address.street = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @purchase_address.telephone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが数字でないと保存できないこと' do
        @purchase_address.telephone_number = 'aaaa'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone number Input only number')
      end
      it 'telephone_numberは11桁以内でないと保存できないこと' do
        @purchase_address.telephone_number = '0000000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone number Input only number')
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
