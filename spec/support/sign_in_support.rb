module SignInSupport
  def sign_in(user)
    visit new_user_session_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on("commit")
    expect(current_path).to eq coffees_path
  end
end