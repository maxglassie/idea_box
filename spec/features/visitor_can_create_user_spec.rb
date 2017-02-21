require 'rails_helper'

RSpec.feature "Visitor tries to create account" do
  context "providing valid credentials" do
    scenario "account creation is successful" do

      visit sign_up_path

      fill_in "Name", with: "Maximus"
      fill_in "Email", with: "maximus@seneca.edu"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"

      click_on "Create Account"

      expect(current_path).to eq(user_path(User.last))

        within("h1.greeting") do
          expect(page).to have_content("Welcome Maximus!")
      end
    end
  end
end