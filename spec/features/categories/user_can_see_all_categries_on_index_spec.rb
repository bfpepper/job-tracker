require 'rails_helper'

RSpec.feature "User can see all the available categories on the index" do
  scenario "User can see all available categories" do

    category1 = create(:category)
    category2 = create(:category)

    visit categories_path

    expect(page).to have_content(category1.title)
    expect(page).to have_content(category2.title)
  end

  scenario "User sees all given categories, delete, and edit buttons" do

    category1 = create(:category)

    visit categories_path

    within("ul:first") do
      expect(page).to have_content("Delete")
      expect(page).to have_content("Edit")
    end

  end
end
