require 'rails_helper'

RSpec.feature "User can add contacts info for a company." do
  scenario "User can ad contact info for company" do

    company = create(:company_with_jobs)

    visit company_path(company)

    fill_in "contact[first_name]", with: "Ben"
    fill_in "contact[last_name]", with: "Pepper"
    fill_in "contact[position]", with: "Sales"
    fill_in "contact[email]", with: "bfpepper87@gmail.com"
    click_on "Create Contact"

    save_and_open_page
    expect(page).to have_content("Ben Pepper")
    expect(page).to have_content("Sales")
    expect(page).to have_content("bfpepper87@gmail.com")

  end
end
