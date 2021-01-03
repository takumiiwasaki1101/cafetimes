require 'rails_helper'

RSpec.describe 'レビューの投稿機能', type: :system do
  before do
    # コーヒー情報の登録
    @coffee = FactoryBot.create(:coffee)

    # フォームに入力する情報をインスタンス変数に代入
    @amount_of_coffee = Faker::Number.within(range: 1..100)
    @amount_of_water = Faker::Number.within(range: 100..900)
    @pre_infusion_time = Faker::Number.within(range: 10..120)
    @extraction_time = Faker::Number.within(range: 1..600)
    @review = Faker::Lorem.sentence
  end

  context 'レビュー投稿成功' do
    it 'レビューの投稿に成功すると、投稿した内容を含んだcoffees#indexページに遷移する' do
      # ログインする
      sign_in(@coffee.user)

      # coffees#indexページへ遷移したことを確認する
      expect(current_path).to eq coffees_path

      # 国旗マーク内のカーソルから「投稿」をクリックするとレビュー投稿画面へ遷移する
      find('.more').hover
      click_on '投稿'
      expect(
        current_path
      ).to eq new_coffee_review_path(@coffee.id)

      # 値をテキストフォームに入力する
      select '2020', from: 'review_date_1i'
      select '12', from: 'review_date_2i'
      select '10', from: 'review_date_3i'
      select 'フレンチプレス', from: 'tool-category'
      fill_in 'amount-of-coffee', with: @amount_of_coffee
      fill_in 'amount-of-water', with: @amount_of_water
      fill_in 'pre-infusion-time', with: @pre_infusion_time
      fill_in 'extraction-time', with: @extraction_time
      fill_in 'review', with: @review

      # レビュー投稿をクリックすると、Reviewモデルのカウントが1上がることを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { Review.count }.by(1)

      # マイページにリダイレクトされることを確認する
      expect(current_path).to eq user_path(@coffee.user.id)

      # 一覧ページに先ほどの投稿内容が含まれていることを確認する
      expect(page).to have_content @review
    end
  end

  context 'レビュー投稿失敗' do
    it 'レビューの投稿に失敗すると、DBは保存されず、レビュー投稿ページに戻される' do
      # ログインする
      sign_in(@coffee.user)

      # coffees#indexページへ遷移したことを確認する
      expect(current_path).to eq coffees_path

      # 国旗マーク内のカーソルから「投稿」をクリックするとレビュー投稿画面へ遷移する
      find('.more').hover
      click_on '投稿'
      expect(
        current_path
      ).to eq new_coffee_review_path(@coffee.id)

      # 必須フォームに入力をしていない状態で、レビューの投稿をクリックしてもReviewモデルのカウントは上がらない
      expect  do
        find('input[name="commit"]').click
      end.not_to change { Review.count }

      # レビューの投稿ページに戻ってくることを確認する
      expect(current_path).to eq coffee_reviews_path(@coffee.id)

      # レビュー豆の投稿ページにエラーメッセージが表示されていることを確認する
      expect(page).to have_selector '#error-alert'
    end
  end
end

RSpec.describe 'レビューの編集機能', type: :system do
  before do

    # レビュー情報の登録
    @review1 = FactoryBot.create(:review)
    @review2 = FactoryBot.create(:review)

    # 編集用情報の生成
    @review = Faker::Lorem.sentence
  end

  context 'レビュー編集成功' do
    it 'ログインしたユーザーは自分が登録したレビュー情報の編集ができる' do
      # レビュー1を登録したユーザーでログインする
      sign_in(@review1.user)

      # ログイン後のヘッダーの名前にカーソルを移動すると「マイページ」ボタンがあることを確認する
      expect(
        all('ul')[1].hover
      ).to have_link('マイレビュー')

      # マイレビューへ遷移する
      visit user_path(@review1.user.id)

      # レビューの詳細ページへ遷移する
      visit review_path(@review1)

      # ページ下部に「編集」ボタンがあることを確認する
      expect(
        page
      ).to have_link '編集'

      # レビューの編集ページへ遷移する
      click_on '編集'

      # すでに登録済みのレビューがフォームに入っていることを確認する
      expect(
        find('#review').value
      ).to eq @review1.review

      # 登録内容を編集する
      fill_in 'review', with: @review

      # 編集してもCoffeeモデルのカウントは変わらないことを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { Review.count }.by(0)

      # マイレビューに遷移したことを確認する
      expect(current_path).to eq user_path(@review1.user.id)

      # マイレビューに先ほどの変更内容が含まれていることを確認する
      expect(page).to have_content @review
    end
  end

  context 'レビュー編集失敗' do
    it 'ログインしたユーザーは自分以外が登録したレビュー情報の編集画面には遷移できない' do
      # レビュー1を登録したユーザーでログインする
      sign_in(@review1.user)

      # ログイン後のヘッダーの名前にカーソルを移動すると「利用者一覧」ボタンがあることを確認する
      expect(
        all('ul')[1].hover
      ).to have_link('利用者一覧')

      # 利用者一覧へ遷移する
      visit users_path

      # レビュー2を登録したユーザーのマイレビューへ遷移する
      click_on @review2.user.nickname

      # ページ下部に「編集」ボタンがないことを確認する
      expect(
        page
      ).to have_no_link '編集'

    end
  end
end