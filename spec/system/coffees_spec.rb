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
    it 'コーヒーの登録に成功すると、コーヒー一覧ページに遷移して、登録した内容が表示されている' do
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

  context '投稿に成功したとき' do
    it '送る値が空の為、メッセージの送信に失敗すること' do
      # サインインする
      sign_in(@room_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)

      # 値をテキストフォームに入力する

      # 送信した値がDBに保存されていることを確認する

      # 投稿一覧画面に遷移していることを確認する

      # 送信した値がブラウザに表示されていることを確認する

    end

    it '画像の投稿に成功すると、投稿一覧に遷移して、投稿した画像が表示されている' do
      # サインインする
      sign_in(@room_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)

      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')

      # 画像選択フォームに画像を添付する

      # 送信した値がDBに保存されていることを確認する

      # 投稿一覧画面に遷移していることを確認する

      # 送信した画像がブラウザに表示されていることを確認する

    end

    it 'テキストと画像の投稿に成功すること' do
      # サインインする
      sign_in(@room_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)

      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')

      # 画像選択フォームに画像を添付する

      # 値をテキストフォームに入力する

      # 送信した値がDBに保存されていることを確認する

      # 送信した値がブラウザに表示されていることを確認する

      # 送信した画像がブラウザに表示されていることを確認する

    end
  end
end