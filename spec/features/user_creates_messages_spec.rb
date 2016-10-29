feature "on the home page the user", js: true do 
  scenario "creates two messages" do 
    alice = Fabricate(:user)
    login(alice)

    select('fun', :from => 'Emoji')
    fill_in "Message", with: "I love emoting!"
    click_button "Submit"
    sleep 1

    select('joy', :from => 'Emoji')
    fill_in "Message", with: "You make me joyful!"
    click_button "Submit"
    sleep 1

    expect(page).to have_css("a[data-content='I love emoting!']")
    expect(page).to have_css("a[data-content='You make me joyful!']")
  end
end