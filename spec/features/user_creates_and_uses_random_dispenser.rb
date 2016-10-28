feature "user can create a random messages dispenser" do 
  scenario "creates and populates random dispenser" do 
    alice = Fabricate(:user)
    recipient = Fabricate(:significant, user: alice)
    m1 = Fabricate(:message, user: alice)
    m2 = Fabricate(:message, user: alice)
    set_current_user(user: alice)

    click_link "Create Dispenser" 
    expect(page).to have_content "Select Your Dispenser"

    select dispenser type
    expect(page).to have_content "Select Your Recipient"

    select recipient 
    expect(page).to have_content "Enter your configuration details and add messages."  

    select 0900 from lower bound
    select 1500 from upper bound

    select 2x from frequency per day
    populate dispenser
    click_button "Create and Begin Sending"

    expect(page).to have_content "Random Sprinkles Dispenser created!"
    expect(page).to have_content "Welcome to Orchestration Station"
  end
end