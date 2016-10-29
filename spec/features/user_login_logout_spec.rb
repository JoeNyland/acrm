require 'rails_helper'

RSpec.feature 'User login and logout', type: :feature do

  fixtures :users, :companies

  before do
    @user = users(:user1)
  end

  scenario 'User attempts to log in with the correct credentials' do
    visit '/login'
    fill_in 'session_email', with: @user.email
    fill_in 'session_password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text("Welcome #{@user.name}")
  end

  scenario 'User attempts to log in with the incorrect credentials' do
    visit '/login'
    fill_in 'session_email', with: @user.email
    fill_in 'session_password', with: 'foo'
    click_button 'Log in'
    expect(page).to have_text('Invalid email/password combination')
  end

  scenario 'User logs out' do
    visit '/login'
    fill_in 'session_email', with: @user.email
    fill_in 'session_password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text("Welcome #{@user.name}")
    click_link 'Log out'
    expect(page).not_to have_text("Welcome #{@user.name}")
  end

end
