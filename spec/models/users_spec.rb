require 'rails_helper'

RSpec.describe User do
  it "user can be created as an admin" do
    user = User.create(name: "Marcus", email: "marcus@seneca.edu", password: "password", password_confirmation: "password", role: 1)

    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
  end

  it "user can be created as a default user" do
    user = User.create(name: "Aristotle", email: "aristotle@socrates.edu", password: "password", password_confirmation: "password", role: 0)

    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
  end
end
