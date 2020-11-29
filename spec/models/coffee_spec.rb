require 'rails_helper'

RSpec.describe Coffee, type: :model do
  describe '#create' do
    before do
      @coffee = FactoryBot.build(:coffee)
    end

    context '新規登録成功時' do
      it 'name、country_id、date_of_purchase、shop、detail
          が存在すれば登録できること' do
        expect(@coffee).to be_valid
      end

      it 'detailが空でも登録できること' do
        @coffee.detail = nil
        expect(@coffee).to be_valid
      end
    end

    context '新規登録失敗時' do
      # 空では登録できないことを確認
      it 'nameが空では登録できないこと' do
        @coffee.name = nil
        @coffee.valid?
        expect(@coffee.errors.full_messages).to include('銘柄を入力してください')
      end

      it 'country_idが空では登録できないこと' do
        @coffee.country_id = nil
        @coffee.valid?
        expect(@coffee.errors.full_messages).to include('原産国を入力してください')
      end

      it 'date_of_purchaseが空では登録できないこと' do
        @coffee.date_of_purchase = nil
        @coffee.valid?
        expect(@coffee.errors.full_messages).to include('購入日を入力してください')
      end

      it 'shopが空では登録できないこと' do
        @coffee.shop = nil
        @coffee.valid?
        expect(@coffee.errors.full_messages).to include('購入店を入力してください')
      end

      # 空では登録できないことを確認

      # idが0の場合は登録できないことを確認
      it 'country_idが0では登録できないこと' do
        @coffee.country_id = 0
        @coffee.valid?
        expect(@coffee.errors.full_messages).to include('原産国を入力してください')
      end
      # idが0の場合は登録できないことを確認
    end
  end
end
