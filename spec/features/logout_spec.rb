require 'rails_helper'

RSpec.feature "Logouts", type: :feature do
  scenario 'After Logged_in, user can logout' do
    User.create(name: 'Cena')
    visit login_path
    fill_in 'name', with: 'Cena'
    click_on 'Login'
    click_on 'Logout'
    expect(page).to have_content('Thanks for your visit')
  end
end
