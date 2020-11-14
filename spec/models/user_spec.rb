require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録成功時' do
      it 'nickname、email、password、password_confirmation、
          が存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できること' do
        @user.password = 'T12345'
        @user.password_confirmation = 'T12345'
        expect(@user).to be_valid
      end

      it 'passwordが半角英数字混合であれば登録できること' do
        @user.password = 'T123456'
        @user.password_confirmation = 'T123456'
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context '新規登録失敗時' do
      # 空では登録できないことを確認
      it 'nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      # /空では登録できないことを確認

      # emailに@が存在しない場合登録できないことを確認
      it 'emailに@が存在しない場合登録できないこと' do
        @user.email = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      # /emailに@が存在しない場合登録できないことを確認

      # 重複したemailが存在する場合登録できないことを確認
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      # /重複したemailが存在する場合登録できないことを確認

      # パスワードの文字数制限を確認
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = 'T1234'
        @user.password_confirmation = 'T1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      # /パスワードの文字数制限を確認

      # パスワードの不一致の場合は登録できないことを確認
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = 'T12345'
        @user.password_confirmation = 'T123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      # パスワードの不一致の場合は登録できないことを確認

      # パスワードは半角英数字混合が必須であることを確認
      it 'passwordが半角数字のみであれば登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが半角英語のみであれば登録できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      # /パスワードは半角英数字混合が必須であることを確認
    end
  end
end

