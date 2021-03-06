require 'rails_helper'

RSpec.feature "User can delete a given job" do
  scenario "A user can delete a job" do

  company = create(:company_with_jobs)

  visit company_jobs_path(company)

  within("ul:first") do
    click_on("Delete")
  end

  expect(current_path).to eq(company_jobs_path(company))
  expect(page).to_not have_content(company.jobs.first.title)
  expect(page).to have_content(company.jobs.last.title)
  end
end
