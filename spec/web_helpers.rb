def visit_index_page_and_enter_name
  visit "/"
  fill_in "name", with: "Ace"
end

def fill_in_a_date_and_submit
  select("5", from: "day")
  select("July", from: "month")
  click_button "Tell me!"
end
