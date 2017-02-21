require 'rails_helper'

RSpec.feature "user can create an idea" do
  scenario "logged in user can create an idea" do
    user = User.create(name: "Maximus", email: "maximus@seneca.edu",
                                  password: "password", password_confirmation: "password")
    wacky = Category.create(name: "wacky")
    brilliant = Category.create(name: "brilliant")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_idea_path(user)

    fill_in "Name", with: "weresquirrel"
    fill_in "Description", with: "human to squirrel on the fullmoon"
    select "weresquirrel", from: "idea[images_ideas]"
    select "wacky", from: "idea[category_id]"

    click_on "Create Idea"

    expect(current_path).to eq(idea_path(user))

    expect(page).to have_content("weresquirrel")
    expect(page).to have_content("human to squirrel on the fullmoon")
    expect(page).to have_content("http://eloquentjavascript.net/img/weresquirrel.png")
    expect(page).to have_content("wacky")
  end
end