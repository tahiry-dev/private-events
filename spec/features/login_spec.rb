require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  scenario 'Access Granted' do 
    User.create(name: 'Mike')
    visit login_path
    fill_in :name, with: 'Mike'
    click_on 'Login'
    expect(page).to have_content 'Mike'
  end
end
