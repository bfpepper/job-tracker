require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    category = create(:category)
    company = Company.create(name: "ESPN", city: "NYC")

    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    select "#{category.title}", from: 'job[category_id]'
    expect(page).to have_content("Create New Category")

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
  end
end
