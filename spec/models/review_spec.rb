require 'rails_helper'

RSpec.describe Review, type: :model do
  describe '#create' do
    before do
      @review = FactoryBot.build(:review)
    end

    context '新規登録成功時' do
      it 'date、tool_id、reviewが存在すれば登録できること' do
        expect(@review).to be_valid
      end

      it 'tool_idが0でも登録できること' do
        @review.tool_id = 0
        expect(@review).to be_valid
      end

    end

    context '新規登録失敗時' do
      # 空では登録できないことを確認
      it 'dateが空では登録できないこと' do
        @review.date = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("Date can't be blank")
      end

      it 'reviewが空では登録できないこと' do
        @review.review = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("Review can't be blank")
      end
      # 空では登録できないことを確認
    end
  end
end
