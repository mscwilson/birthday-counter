require "date"

feature "index page" do 

  scenario "shows a welcome message" do
    visit "/"
    expect(page).to have_content "How long do I have to wait until my birthday?"
  end

  scenario "enter a name and date" do
    visit_index_page_and_enter_name
    fill_in_a_date_and_submit
    expect(page).to have_content "Ace"
  end

  scenario "says stranger if name not entered" do
    visit "/"
    fill_in_a_date_and_submit
    expect(page).to have_content "stranger"
  end


end
