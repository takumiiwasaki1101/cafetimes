require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  
  it 'ログインに成功し、coffees#indexページに遷移する' do
    # ユーザーをDBに保存する
    @user = FactoryBot.create(:user)

    # サインインページへ移動する
    visit new_user_session_path
    
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path

    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password

    # ログインボタンをクリックする
    click_on("commit")

    # coffees#indexページに遷移していることを確認する
    expect(current_path).to eq coffees_path

  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)

    # サインインページへ移動する
    visit new_user_session_path

    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path

    # 誤ったユーザー情報を入力する
    fill_in 'email', with: "test"
    fill_in 'password', with: "hoge"

    # ログインボタンをクリックする
    click_on("commit")

    # サインインページに戻ってきていることを確認する
    expect(current_path).to eq new_user_session_path

  end
end
