require 'rails_helper'

RSpec.feature "USer can create a new cateegory" do
  scenario "USer can create a new category" do

    visit new_category_path

    fill_in 'category[title]', with: "Cars"
    click_on "Create Category"

    expect(page).to have_content("Cars")

  end
end
