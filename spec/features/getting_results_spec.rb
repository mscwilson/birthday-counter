require "date"

feature "results page" do 

  scenario "wishes a happy birthday if it's today" do
    today = Date.today
    visit_index_page_and_enter_name
    select("#{today.day.to_s}", from: "day")
    select("#{today.strftime("%B")}", from: "month")
    click_button "Tell me!"
    expect(page).to have_content "Happy birthday"
  end

end
