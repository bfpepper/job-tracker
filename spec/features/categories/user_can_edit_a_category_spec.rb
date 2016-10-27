require 'rails_helper'

RSpec.feature "User can modify or delete a category" do
  scenario "User can edit a category" do

    category = create(:category)

    visit categories_path

    within("ul:first") do
      click_on("Edit")
    end

    expect(current_path).to eq(edit_category_path(category))

    fill_in "category[title]", with: "New Title"
    click_on "Update Category"

    expect(current_path).to eq(category_path(category))
  end

  scenario "User can delete a given category" do

    category = create(:category)
    category2 = create(:category)

    visit categories_path

    within("ul:first") do
      click_on("Delete")
    end

    expect(current_path).to eq(categories_path)

    within("ul:first") do
      expect(page).to have_content(category2.title)
    end

    expect(page).to_not have_content(category.title)
  end
end
