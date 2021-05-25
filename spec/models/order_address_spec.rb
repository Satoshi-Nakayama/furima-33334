require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '必要な情報を適切に入力すると購入できる' do
      expect(@order_address).to be_valid
    end

    it '建物名が無くても購入できる' do
      @order_address.building_name = ""
      expect(@order_address).to be_valid
    end

    it '郵便番号が無いと購入できない' do
      @order_address.zip_code = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Zip code can't be blank")
    end
    it '郵便番号にハイフンが無いと購入できない' do
      @order_address.zip_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
    end
    it '郵便番号が全角だと購入できない' do
      @order_address.zip_code = "１２３４５６７"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
    end
    it '都道府県を選択していないと購入できない' do
      @order_address.prefecture = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture select  ")
    end
    it '市区町村が無いと購入できない' do
      @order_address.city = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が無いと購入できない' do
      @order_address.address_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address number can't be blank")
    end
    it '電話番号が無いと購入できない' do
      @order_address.phone_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が12桁以上だと購入できない' do
      @order_address.phone_number = "123412341234"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
    end
    it '電話番号が全角だと購入できない' do
      @order_address.phone_number = "０９０１１２２３３４４"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
    end
    it "tokenが空では購入できない" do
      @order_address.token = nil
      @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it "user_idが無いと購入できない" do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが無いと購入できない" do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end

