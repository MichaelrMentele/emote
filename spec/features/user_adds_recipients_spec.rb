feature "user adds recipients" do 
  scenario "and creates two" do 
    alice = Fabricate(:user)
    
    login(alice)

    visit home_path
    find(".add-recipient a").click
    sleep 1

    fill_in "Recipient Name", with: "Brianna Pizana"
    fill_in "Phone Number", with: "5555555555"
    click_button "Create"
    sleep 1

    expect(page).to have_content "Brianna Pizana has been added!"
    expect(page).to have_content "Dispensers"
  end
end