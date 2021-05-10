require "rails_helper"

RSpec.feature "Visiting the homepage", type: :feature do
  scenario "The visitor should see projects" do
    visit root_path
    expect(page).to have_text("Projects")
  end
end

RSpec.feature "Signing up", type: :feature do
  scenario "The visitor should be able to create an account" do
    visit root_path
    click_link "Sign up", match: :first
    fill_in "Email", with: "dbatizy@uccs.edu"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_text("Welcome! You have signed up successfully.")
  end
end

RSpec.feature "Delete account", type: :feature do
  scenario "The visitor should be able to delete an account" do
    visit root_path
    click_link "Sign up", match: :first
    fill_in "Email", with: "dbatizy@uccs.edu"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "Edit profile", match: :first
    click_button "Cancel my account"
    expect(page).to have_text("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
  end
end