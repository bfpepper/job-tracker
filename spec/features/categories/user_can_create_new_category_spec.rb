require 'rails_helper'

RSpec.feature "USer can create a new cateegory" do
  scenario "USer can create a new category" do

    visit new_category_path

    fill_in 'category[title]', with: "Cars"
    click_on "Create Category"

    expect(page).to have_content("Cars")
    expect(current_path).to eq(category_path(Category.last))
  end

  scenario "If a user creates a category twuce they are told it already exists" do

    category = create(:category)

    visit new_category_path

    fill_in 'category[title]', with: category.title
    click_on "Create Category"

    expect(page).to have_content("That category is already created.")
  end
end
