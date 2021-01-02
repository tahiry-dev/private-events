require 'rails_helper'

RSpec.feature "CreateEvents", type: :feature do
  scenario 'visitor can login and create events' do
    User.create(name: 'James')
    visit login_path
    fill_in 'name', with: 'James'
    click_on 'Login'
    expect(page).to have_content 'James'

    visit new_event_path
    fill_in 'description', with: 'beer party'
    click_button 'Create'
    expect(page).to have_content('Your event Has been created')
  end
end
