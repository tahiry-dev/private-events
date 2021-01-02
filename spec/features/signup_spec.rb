require 'rails_helper'

RSpec.feature "Signups", type: :feature do
  scenario 'visitor could create an account with name' do
    visit new_user_path
    fill_in :name, with: 'John'
    click_on 'New Account'
    expect(page).to have_content('welcome to Private Events APP') 
  end

  scenario 'visitors cannot create account with blank name' do
    visit new_user_path
    fill_in :name, with: ''
    click_on 'New Account'
    expect(page).to have_content('') 
  end
end
