require 'rails_helper'

RSpec.describe "コーヒー豆の登録機能", type: :system do
  before do
    # ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    # フォームに入力する情報をインスタンス変数に代入
    @name = Faker::Coffee.country
    @shop = Faker::Restaurant.name
    @detail = Faker::Lorem.sentence
  end

  context '登録に成功したとき' do
    it 'コーヒーの登録に成功すると、登録した内容を含んだコーヒー一覧ページに遷移する' do
      # サインインする
      sign_in(@user)

      # ヘッダーにある「コーヒー豆の登録」をクリックする
      click_on "coffee-registration"

      # コーヒー豆の登録ページに遷移していることを確認する
      expect(current_path).to eq new_coffee_path

      # 値をテキストフォームに入力する
      fill_in 'name', with: @name
      select 'ベトナム', from: "country" 
      select '2020', from: "coffee_date_of_purchase_1i" 
      select '12', from: "coffee_date_of_purchase_2i" 
      select '10', from: "coffee_date_of_purchase_3i" 
      fill_in 'shop', with: @shop
      fill_in 'detail', with: @detail

      # コーヒー豆の登録をクリックすると、Coffeeモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Coffee.count }.by(1)

      # コーヒー豆の一覧ページにリダイレクトされることを確認する
      expect(current_path).to eq coffees_path

      # 一覧ページに先ほどの登録内容が含まれていることを確認する
      expect(page).to have_content @name
    end
  end

  context '登録に失敗したとき' do
    it 'コーヒーの登録に失敗すると、DBは保存されず、コーヒー登録ページに戻される' do
      # サインインする
      sign_in(@user)

      # ヘッダーにある「コーヒー豆の登録」をクリックする
      click_on "coffee-registration"

      # コーヒー豆の登録ページに遷移していることを確認する
      expect(current_path).to eq new_coffee_path

      # コーヒー豆の登録をクリックしても、Coffeeモデルのカウントは上がらない
      expect{
        find('input[name="commit"]').click
      }.not_to change { Coffee.count }

      # コーヒー豆の登録ページに戻ってくることを確認する
      expect(page).to have_content "コーヒー豆の登録"

      # コーヒー豆の登録ページにエラーメッセージが表示されていることを確認する
      expect(page).to have_selector '#error-alert'
    end
  end
end