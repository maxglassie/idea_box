require 'rails_helper'

RSpec.feature "User can login" do
  scenario "existing user can login in" do
    user = User.create(name: "Maximus", email: "maximus@seneca.edu",
                                  password: "password", password_confirmation: "password")

    visit login_path

    expect(page).to have_content("Login here!")

    fill_in "Email", with: "maximus@seneca.edu"
    fill_in "Password", with: "password"
    click_on "Log In"

    expect(current_path).to eq(user_path(user))

    within("h1.greeting") do
        expect(page).to have_content("Welcome Maximus!")
    end

    within("div.user_info") do
      expect(page).to have_content("Email: maximus@seneca.edu")
    end
  end
end