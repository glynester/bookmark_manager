require 'spec_helper'

feature 'Adding new links' do
  scenario 'adding links' do
    visit '/links/new'
    fill_in('title', with: "Facebook")
    fill_in('url', with: "www.facebook.com")
    click_button('Save')
    expect(current_path).to eq '/links'

    with 'ul#links' do
      expect(page).to have_content('This is Facebook')
    end
  end
end
