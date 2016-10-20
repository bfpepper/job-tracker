require 'rails_helper'

RSpec.feature "User can delete a given job" do
  scenario "A user can delete a job" do

  company = create(:company_with_jobs)

  visit company_jobs_path(company)
save_and_open_page
  within("ul:first") do
    click_on("Delete")
  end

  expect(current_path).to eq(company_jobs_path(company))
  expet(page).to_not have_content(job.first.name)
  expet(page).to have_content(job.last.name)
  end
end
