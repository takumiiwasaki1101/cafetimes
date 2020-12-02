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
      expect(page).to have_content @shop
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

      # 必須フォームに入力をしていない状態で、コーヒー豆の登録をクリックしてもCoffeeモデルのカウントは上がらない
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

RSpec.describe "コーヒー豆の編集機能", type: :system do
  before do
    # コーヒーをDBに保存する
    @coffee = FactoryBot.create(:coffee)

    # 編集用情報をインスタンス変数に代入
    @name = Faker::Coffee.country
    @shop = Faker::Restaurant.name
    @detail = Faker::Lorem.sentence
  end

  context '編集に成功したとき' do
    it 'ログインしたユーザーは自分が登録したコーヒー情報の編集ができる' do
      # コーヒーを登録したユーザーでサインインする
      sign_in(@coffee.user)

      # 登録したコーヒーの画像内に「編集」ボタンがあることを確認する
      expect(
        all(".more")[0].hover
      ).to have_link '編集', href: edit_coffee_path(@coffee)
 
      # コーヒー豆の編集ページへ遷移する
      visit edit_coffee_path(@coffee)

      # すでに登録済みの内容がフォームに入っていることを確認する
      expect(
        find('#name').value
      ).to eq @coffee.name
      expect(
        find('#country').value
      ).to eq @coffee.country.id.to_s
      expect(
        find('#coffee_date_of_purchase_1i').value
      ).to eq @coffee.date_of_purchase.year.to_s
      expect(
        find('#coffee_date_of_purchase_2i').value
      ).to eq @coffee.date_of_purchase.month.to_s
      expect(
        find('#coffee_date_of_purchase_3i').value
      ).to eq @coffee.date_of_purchase.day.to_s
      expect(
        find('#shop').value
      ).to eq @coffee.shop
      expect(
        find('#detail').value
      ).to eq @coffee.detail

      # 登録内容を編集する
      fill_in 'name', with: @name
      fill_in 'shop', with: @shop
      fill_in 'detail', with: @detail

      # 編集してもCoffeeモデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Coffee.count }.by(0)

      # コーヒー一覧ページに遷移したことを確認する
      expect(current_path).to eq coffees_path

      # 一覧ページに先ほどの変更内容が含まれていることを確認する
      expect(page).to have_content @name
      expect(page).to have_content @shop
    end
  end
end

RSpec.describe 'コーヒー豆の削除機能', type: :system do
  before do
    # コーヒーをDBに保存する
    @coffee = FactoryBot.create(:coffee)
  end
  
  context '削除に成功したとき' do
    it 'ログインしたユーザーは自分が登録したコーヒー情報の削除ができる' do
      # コーヒーを登録したユーザーでサインインする
      sign_in(@coffee.user)

      # 登録したコーヒーの画像内に「編集」ボタンがあることを確認する
      expect(
        all(".more")[0].hover
      ).to have_link '削除', href: coffee_path(@coffee)
 
      # 登録を削除するとレコードの数が1減ることを確認する
      expect{
        all(".more")[0].hover.find_link('削除', href: coffee_path(@coffee)).click
      }.to change { Coffee.count }.by(-1)

      # コーヒー一覧ページに遷移したことを確認する
      expect(current_path).to eq coffees_path

      # コーヒー一覧ページには@coffeeの内容が存在しないことを確認する
      expect(page).to have_no_content @coffee.name
      expect(page).to have_no_content @coffee.shop
    end
  end
end