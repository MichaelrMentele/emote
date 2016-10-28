feature "user logs in", js: true do 
  background do 
    visit login_path
  end

  scenario "Valid user logs in" do 
    alice = Fabricate(:user)
    fill_in "Email Address", with: alice.email
    fill_in "Password", with: alice.password
    click_button "Login"
    sleep 1

    expect(page).to have_content "Messages"
    expect(page).to have_content "Dispensers"
  end

  scenario "Invalid users logs in" do 
    fill_in "Email Address", with: "invalid@user.com"
    fill_in "Password", with: "faker"
    click_button "Login"
    sleep 1

    expect(page).to have_content "Invalid email or password."
  end
end