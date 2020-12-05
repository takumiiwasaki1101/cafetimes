require 'rails_helper'

RSpec.describe "ユーザー新規登録機能", type: :system do
  before do
    # ユーザー情報の生成
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録成功' do
    it '正しい情報を入力するとユーザー新規登録ができてcoffees#indexページに遷移する' do
      # トップページに遷移する
      visit root_path

      # トップページに新規登録ページへ遷移するボタンがあることを確認する
      expect(page).to have_link('新規登録')

      # 新規登録ページへ遷移する
      visit new_user_registration_path

      # ユーザー情報を入力する
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password

      # 会員登録ボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)

      # coffees#indexページへ遷移したことを確認する
      expect(current_path).to eq coffees_path

      # カーソルを合わせると各種ページへのリンクが表示されることを確認する
      expect(
        all("ul")[1].hover
      ).to have_link('マイページ')
      expect(
        all("ul")[1].hover
      ).to have_link('利用者一覧')
      expect(
        all("ul")[1].hover
      ).to have_link('ログアウト')

      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_link('ログイン')
      expect(page).to have_no_link('新規登録')
    end
  end

  context 'ユーザー新規登録失敗' do
    it '誤った情報を入力するとユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに遷移する
      visit root_path

      # トップページに新規登録ページへ遷移するボタンがあることを確認する
      expect(page).to have_link('新規登録')

      # 新規登録ページへ遷移する
      visit new_user_registration_path

      # ユーザー情報を入力する
      fill_in 'nickname', with: ""
      fill_in 'email', with: ""
      fill_in 'password', with: ""
      fill_in 'password-confirmation', with: ""

      # 会員登録ボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)

      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq "/users"

      # 新規登録ページにエラーメッセージが表示されていることを確認する
      expect(page).to have_selector '#error-alert'
    end
  end
end

RSpec.describe "ユーザーログイン機能", type: :system do
  before do
    # ユーザー情報の登録
    @user = FactoryBot.create(:user)
  end

  context 'ユーザーログイン成功' do  
    it 'ログインに成功し、coffees#indexページに遷移する' do
      # トップページに遷移する
      visit root_path

      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_link('ログイン')

      # ログインページへ遷移する
      visit new_user_session_path
      
      # すでに保存されているユーザーのemailとpasswordを入力する
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password

      # ログインボタンをクリックする
      click_on("commit")

      # coffees#indexページに遷移していることを確認する
      expect(current_path).to eq coffees_path
    end
  end

  context 'ユーザーログイン失敗' do  
    it 'ログインに失敗し、再びサインインページに戻ってくる' do
      # トップページに遷移する
      visit root_path

      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_link('ログイン')

      # サインインページへ遷移する
      visit new_user_session_path

      # 誤ったユーザー情報を入力する
      fill_in 'email', with: "test"
      fill_in 'password', with: "hoge"

      # ログインボタンをクリックする
      click_on("commit")

      # ログインページに戻ってきていることを確認する
      expect(current_path).to eq new_user_session_path
    end
  end
end
