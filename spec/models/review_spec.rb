require 'rails_helper'

RSpec.describe Review, type: :model do
  describe '#create' do
    before do
      @review = FactoryBot.build(:review)
    end

    context '新規登録成功時' do
      it 'date、tool_id、amount_of_coffee、amount_of_water、pre_infusion_time、extraction_time、reviewが存在すれば登録できること' do
        expect(@review).to be_valid
      end

      # 空や0でも登録できることを確認
      it 'tool_idが0でも登録できること' do
        @review.tool_id = 0
        expect(@review).to be_valid
      end

      it 'amount_of_coffeeが空でも登録できること' do
        @review.amount_of_coffee = nil
        expect(@review).to be_valid
      end

      it 'amount_of_waterが空でも登録できること' do
        @review.amount_of_water = nil
        expect(@review).to be_valid
      end

      it 'pre_infusion_timeが空でも登録できること' do
        @review.pre_infusion_time = nil
        expect(@review).to be_valid
      end

      it 'extraction_timeが空でも登録できること' do
        @review.extraction_time = nil
        expect(@review).to be_valid
      end
      # //空や0でも登録できることを確認

    end

    context '新規登録失敗時' do
      # 空では登録できないことを確認
      it 'dateが空では登録できないこと' do
        @review.date = nil
        @review.valid?
        expect(@review.errors.full_messages).to include('飲んだ日を入力してください')
      end

      it 'reviewが空では登録できないこと' do
        @review.review = nil
        @review.valid?
        expect(@review.errors.full_messages).to include('レビューを入力してください')
      end
      # 空では登録できないことを確認

      # 半角数字のみ保存可能であることを確認
      it 'amount_of_coffeeが全角数字だと保存できないこと' do
        @review.amount_of_coffee = '２５'
        @review.valid?
        expect(@review.errors.full_messages).to include('コーヒー豆の量は半角数字で入力してください')
      end

      it 'amount_of_waterが全角数字だと保存できないこと' do
        @review.amount_of_water = '４００'
        @review.valid?
        expect(@review.errors.full_messages).to include('お湯の量は半角数字で入力してください')
      end

      it 'pre_infusion_timeが全角数字だと保存できないこと' do
        @review.pre_infusion_time = '６０'
        @review.valid?
        expect(@review.errors.full_messages).to include('蒸らし時間は半角数字で入力してください')
      end

      it 'extraction_timeが全角数字だと保存できないこと' do
        @review.extraction_time = '１８０'
        @review.valid?
        expect(@review.errors.full_messages).to include('抽出時間は半角数字で入力してください')
      end
      # 半角数字のみ保存可能であることを確認
      
    end
  end
end
