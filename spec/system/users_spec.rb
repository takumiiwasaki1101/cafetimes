require 'rails_helper'

RSpec.describe "ユーザー新規登録機能", type: :system do
  before do
    # ユーザーアカウントの生成
    @user = FactoryBot.build(:user)
  end

  it '正しい情報を入力すればユーザー新規登録ができてcoffees#indexページに移動する' do
    # トップページに移動する
    visit root_path

    # トップページにサインアップページへ遷移するボタンがあることを確認する
    expect(page).to have_content('新規登録')

    # 新規登録ページへ移動する
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

    # ログインボタンを押すとユーザーモデルのカウントが1上がることを確認する
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
