feature "index page" do 

  scenario "shows a welcome message" do
    visit "/"
    expect(page).to have_content "How long do I have to wait until my birthday?"
  end

  scenario "enter a name" do
    visit "/"
    fill_in "name", with: "Ace"
    click_button "Tell me!"
    expect(page).to have_content "Ace"
  end

  scenario "enter a date" do
    visit "/"
    fill_in "name", with: "Ace"
    select("5", from: "day")
    select("July", from: "month")
    click_button "Tell me!"
    expect(page).to have_content "5 July"
  end


end
