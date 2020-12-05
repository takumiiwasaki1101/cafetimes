require 'rails_helper'

RSpec.describe 'レビューの投稿機能', type: :system do
  before do
    # レビュー情報の投稿
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
