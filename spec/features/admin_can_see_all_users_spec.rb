require 'rails_helper'

RSpec.feature "admin visits users index page" do
  context "as admin" do
    scenario "allows admin to see all users" do
      admin = User.create(name: "Maximus", email: "maximus@seneca.edu",
                                  password: "password", 
                                  password_confirmation: "password", 
                                  role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path
      expect(page).to have_content("All Users")
      expect(page).to have_content("Maximus")
    end
  end

  context "as default" do
    scenario "default user does not see admin users index" do
      user = User.create(name: "Aristotle", email: "aristotle@socrates.edu", 
                                      password: "password", 
                                      password_confirmation: "password", 
                                      role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_users_path

      expect(page).to_not have_content("All Users")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end