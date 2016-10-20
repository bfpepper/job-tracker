require 'rails_helper'

describe Category do
  describe "validations" do
    
    context "invalid attributes" do
      it "is invalid without a title" do
        category = Category.create(title: nil)
        expect(category).to be_invalid
      end

      it "cannot have the same title twice" do
        category1 = Category.create(title: "thing")
        category2 = Category.create(title: "thing")
        expect(category2).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title" do
        category = Category.create(title: "thing")
        expect(category).to be_valid
      end
    end
  end
end
