require 'rails_helper'

RSpec.feature "User can modify a given jobs info" do
  scenario "User can change jobs info" do

    company = create(:company)
    job = company.jobs.create(title: "Old Title", level_of_interest: 2)
    new_title = "This new title"

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: new_title
    click_on "Update Job"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("This new title")
  end
end
