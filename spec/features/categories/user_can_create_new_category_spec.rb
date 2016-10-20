require 'rails_helper'

RSpec.feature "USer can create a new cateegory" do
  scenario "USer can create a new category" do

    category = Category.create(title: "Cars")

    visit 

  end
end
