module SignInSupport

  def sign_in(user: create(User))
    @current_user = user
    visit "/users/sign_in"
    fill_in "Email", with: @current_user.email
    fill_in "Password", with: @current_user.password
    click_on "Sign in"
  end

end
