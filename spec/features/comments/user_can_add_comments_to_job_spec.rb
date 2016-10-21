require 'rails_helper'

RSpec.feature "User can add comments to a job" do
  scenario "USer can add comments to a job posting." do

    company = create(:company)
    job = company.jobs.create(title: "Test", description: "thing", level_of_interest: 3)

    visit company_job_path(company, job)

    fill_in 'comment[content]', with: "This comment"

    click_on('Create Comment')

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("This comment")

  end
end
