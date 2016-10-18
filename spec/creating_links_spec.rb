require 'spec_helper'

feature 'Adding new links' do
  scenario 'adding links' do
    visit '/links/new'
    fill_in('Title', with: "Facebook")
    fill_in('Site Address', with: "www.facebook.com")
    click_button('Save')
    expect(page).to have_content("Facebook")
    expect(page).to have_content("www.facebook.com")
  end
end
