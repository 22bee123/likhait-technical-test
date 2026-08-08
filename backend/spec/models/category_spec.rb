require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is valid with a name" do
    category = Category.new(name: "Pets")

    expect(category).to be_valid
  end

  it "is invalid without a name" do
    category = Category.new(name: "")

    expect(category).not_to be_valid
    expect(category.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    Category.create!(name: "Food")
    category = Category.new(name: "Food")

    expect(category).not_to be_valid
    expect(category.errors[:name]).to include("has already been taken")
  end

  it "is invalid with a duplicate name regardless of case" do
    Category.create!(name: "Food")
    category = Category.new(name: "food")

    expect(category).not_to be_valid
  end

  it "is invalid with a name longer than 100 characters" do
    category = Category.new(name: "a" * 101)

    expect(category).not_to be_valid
    expect(category.errors[:name]).to include("is too long (maximum is 100 characters)")
  end
end
